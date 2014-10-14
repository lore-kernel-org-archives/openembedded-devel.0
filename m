Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 478ED6ACB8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 08:03:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9E831Ew015544
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 01:03:01 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 14 Oct 2014 01:03:01 -0700
Message-ID: <543CD8B2.2010805@windriver.com>
Date: Tue, 14 Oct 2014 16:02:58 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1411978974-17996-1-git-send-email-Chong.Lu@windriver.com>
	<5436338B.10408@windriver.com>
In-Reply-To: <5436338B.10408@windriver.com>
X-Originating-IP: [128.224.162.204]
Subject: Re: [meta-oe][PATCH] samba: add systemd service file
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Oct 2014 08:03:02 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

ping

Best Regards
Chong

On 10/09/2014 03:04 PM, Chong Lu wrote:
> ping
>
> //Chong
>
> On 09/29/2014 04:22 PM, Chong Lu wrote:
>> Add systemd service for samba.
>>
>> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
>> ---
>>   meta-oe/recipes-connectivity/samba/samba.inc       | 32 
>> +++++++++++++++++++++-
>>   .../recipes-connectivity/samba/samba/nmb.service   | 12 ++++++++
>>   .../recipes-connectivity/samba/samba/smb.service   | 13 +++++++++
>>   .../samba/samba/winbind.service                    | 12 ++++++++
>>   4 files changed, 68 insertions(+), 1 deletion(-)
>>   create mode 100644 
>> meta-oe/recipes-connectivity/samba/samba/nmb.service
>>   create mode 100644 
>> meta-oe/recipes-connectivity/samba/samba/smb.service
>>   create mode 100644 
>> meta-oe/recipes-connectivity/samba/samba/winbind.service
>>
>> diff --git a/meta-oe/recipes-connectivity/samba/samba.inc 
>> b/meta-oe/recipes-connectivity/samba/samba.inc
>> index 3da0562..4392821 100644
>> --- a/meta-oe/recipes-connectivity/samba/samba.inc
>> +++ b/meta-oe/recipes-connectivity/samba/samba.inc
>> @@ -8,11 +8,18 @@ SRC_URI = 
>> "http://samba.org/samba/ftp/stable/samba-${PV}.tar.gz \
>>              file://init.samba \
>>              file://init.winbind \
>>              file://tdb.pc \
>> +           file://nmb.service \
>> +           file://smb.service \
>> +           file://winbind.service \
>>   "
>>     S = "${WORKDIR}/samba-${PV}/source"
>>   -inherit autotools-brokensep update-rc.d
>> +inherit autotools-brokensep update-rc.d systemd
>> +
>> +SYSTEMD_PACKAGES = "${PN} winbind"
>> +SYSTEMD_SERVICE_${PN} = "nmb.service smb.service"
>> +SYSTEMD_SERVICE_winbind = "winbind.service"
>>     SAMBAMMAP = "no"
>>   SAMBAMMAP_libc-glibc = "yes"
>> @@ -103,6 +110,29 @@ do_install_append() {
>>         # usershare mount place
>>       mkdir -p ${D}${localstatedir}/lib/samba/usershares
>> +
>> +    # Remove sysinit script if sysvinit is not in DISTRO_FEATURES
>> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'false', 
>> 'true', d)}; then
>> +        rm -rf ${D}${sysconfdir}/init.d/
>> +    fi
>> +
>> +    install -d ${D}${systemd_unitdir}/system
>> +    for i in nmb smb winbind; do
>> +        install -m 0644 ${WORKDIR}/$i.service 
>> ${D}${systemd_unitdir}/system
>> +    done
>> +    sed -e 's,@BASE_BINDIR@,${base_bindir},g' \
>> +        -e 's,@SBINDIR@,${sbindir},g' \
>> +        -i ${D}${systemd_unitdir}/system/*.service
>> +}
>> +
>> +DEPENDS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 
>> 'systemd', 'systemd-systemctl-native', '', d)}"
>> +pkg_postinst_${PN} () {
>> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd sysvinit', 
>> 'true', 'false', d)}; then
>> +        if [ -n "$D" ]; then
>> +            OPTS="--root=$D"
>> +        fi
>> +        systemctl $OPTS mask samba.service
>> +    fi
>>   }
>>     pkg_postinst_libnss-winbind () {
>> diff --git a/meta-oe/recipes-connectivity/samba/samba/nmb.service 
>> b/meta-oe/recipes-connectivity/samba/samba/nmb.service
>> new file mode 100644
>> index 0000000..91b9975
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/samba/samba/nmb.service
>> @@ -0,0 +1,12 @@
>> +[Unit]
>> +Description=Samba NMB Daemon
>> +After=syslog.target network.target
>> +
>> +[Service]
>> +Type=forking
>> +PIDFile=/var/run/nmbd.pid
>> +ExecStart=@SBINDIR@/nmbd
>> +ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
>> +
>> +[Install]
>> +WantedBy=multi-user.target
>> diff --git a/meta-oe/recipes-connectivity/samba/samba/smb.service 
>> b/meta-oe/recipes-connectivity/samba/samba/smb.service
>> new file mode 100644
>> index 0000000..bc0707a
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/samba/samba/smb.service
>> @@ -0,0 +1,13 @@
>> +[Unit]
>> +Description=Samba SMB Daemon
>> +After=syslog.target network.target nmb.service winbind.service
>> +
>> +[Service]
>> +Type=forking
>> +PIDFile=/var/run/smbd.pid
>> +LimitNOFILE=16384
>> +ExecStart=@SBINDIR@/smbd
>> +ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
>> +
>> +[Install]
>> +WantedBy=multi-user.target
>> diff --git a/meta-oe/recipes-connectivity/samba/samba/winbind.service 
>> b/meta-oe/recipes-connectivity/samba/samba/winbind.service
>> new file mode 100644
>> index 0000000..bff6fb8
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/samba/samba/winbind.service
>> @@ -0,0 +1,12 @@
>> +i[Unit]
>> +Description=Samba Winbind Daemon
>> +After=syslog.target network.target nmb.service
>> +
>> +[Service]
>> +Type=forking
>> +PIDFile=/var/run/winbindd.pid
>> +ExecStart=@SBINDIR@/winbindd
>> +ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
>> +
>> +[Install]
>> +WantedBy=multi-user.target
>


