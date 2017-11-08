Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3B66665CBB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Nov 2017 21:37:43 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id j15so3727235wre.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Nov 2017 13:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aGV/Z+GKf9eGxheizfmb9rlbFpBJ9ClmwMmTMOYMwNc=;
	b=Zcu6r+icK7j9iOvyxOD846jo1nL3Xopuo6xXT0jl7WDGBwUJT9r/u8cQCOE3wiMyJx
	BK9d5sRq9oTD6/D2RqRm2syXfhrqrbUhjdHbZifgQsuCovEM6FX9EtNUG+7x3G1qAl28
	7RQBMFd+GfVLUzSQsiuVxUEB3HIfmG4euwQSN1ZPl58+e88nLBmDO13Iu4P3krt9pVIz
	raDkFO3lqMGGNBog+6PNlwfOGxGzWhACmcJ26DoOBlh6b0t6dZGthNE0t7FoXah5zxaW
	LfiCf+v+rdIQ3TfT9bYB8yz5yNKcin9bNzcd6y8IDFkLDWInleqCT0IM+/eK1eSxzV9W
	siWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aGV/Z+GKf9eGxheizfmb9rlbFpBJ9ClmwMmTMOYMwNc=;
	b=P7B7p40y/gXrlz4MlqmICDkx9VRx2uZffyBPk2x5BKiWTjmCNmsKV8bRgn2gjmEcxv
	h/v65UWhQjiBpRzL5OxIO31VfGYIiTIoWdsxkqPDuGyCJxVVHwZTon4Jj20GA27m/Hp+
	vQI6iuHavyhavGrusrj8l3ODK/5z7WZkzp+rdaIUKCe2VYrQB3ppIcRaFgUQMo8ItAi3
	gWf0WDqm3xA1dIzY8AMd7JNsuvpm69BVDsfeMiX+VD2QoPgVUW9ZehM/30sB6yS9VAZR
	XaN62kPC2IdUJp7VZbxWEITLZOwsaP1lAXG3KI7ibf/Noj74PMEfATCCkMwSSxd4XcHW
	etYw==
X-Gm-Message-State: AJaThX5mgEugRvdo+5k4nzamJ/7FQQ0ugC5HFMK4UfQxvw6GB7saMtKY
	eA1Sn0wjqGt/0i4Nvk16YYh2EycgTgifHdHcTvHFKA==
X-Google-Smtp-Source: ABhQp+RUCQKgVi7DC70pITICjQaxJfNW4pXy3BC/v0BXtKjYjW2bJayv0vGmaKUEpsn4u5B+vj5UP930gkgfWbXydRA=
X-Received: by 10.223.169.135 with SMTP id b7mr1521480wrd.171.1510177064787;
	Wed, 08 Nov 2017 13:37:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Wed, 8 Nov 2017 13:37:44 -0800 (PST)
In-Reply-To: <CA+chaQeKUJT0MBZ3S7uFpj9j_49_Fda=KynqnH9vkF6NsOZxxA@mail.gmail.com>
References: <1509542622-20015-1-git-send-email-joe_macdonald@mentor.com>
	<1509542622-20015-2-git-send-email-joe_macdonald@mentor.com>
	<CA+chaQeKUJT0MBZ3S7uFpj9j_49_Fda=KynqnH9vkF6NsOZxxA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 8 Nov 2017 22:37:44 +0100
Message-ID: <CA+chaQeKAwPkE1zZkF1=qSYmC365GJ9jKMFyEgSBOYygi=BJWg@mail.gmail.com>
To: Joe MacDonald <joe_macdonald@mentor.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2 1/6] ddclient: new package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Nov 2017 21:37:44 -0000
Content-Type: text/plain; charset="UTF-8"

http://lists.openembedded.org/pipermail/openembedded-devel/2017-February/111447.html

On Wed, Nov 8, 2017 at 10:35 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> libio-socket-ssl-perl is in meta-perl and meta-networking doesn't depend
> on meta-perl.
>
> See my review from Feb 22
>
> On Wed, Nov 1, 2017 at 2:23 PM, Joe MacDonald <joe_macdonald@mentor.com>
> wrote:
>
>> From: "Kinsella, Ray" <ray.kinsella@intel.com>
>>
>> Adding the package ddclient. DDClient updates Dynamic DNS servers with an
>> IP address.
>> Recipe is based on the original OE recipe found here.
>>
>> http://cgit.openembedded.org/openembedded/tree/recipes/ddcli
>> ent/ddclient_3.6.3.bb
>>
>> with modifications based on the recipe at:
>>
>> https://github.com/cshoredaniel/meta-cshored/blob/master/
>> recipes-connectivity/ddclient/ddclient_3.8.3.bb
>>
>> DDClient version has been updated to 3.8.3.
>>
>> Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
>> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
>> ---
>>  .../recipes-daemons/ddclient/ddclient_3.8.3.bb     | 45
>> ++++++++++++++++++++++
>>  .../recipes-daemons/ddclient/files/ip-up           |  4 ++
>>  .../recipes-daemons/ddclient/files/persistent      |  1 +
>>  3 files changed, 50 insertions(+)
>>  create mode 100644 meta-networking/recipes-daemons/ddclient/
>> ddclient_3.8.3.bb
>>  create mode 100644 meta-networking/recipes-daemons/ddclient/files/ip-up
>>  create mode 100644 meta-networking/recipes-daemon
>> s/ddclient/files/persistent
>>
>> diff --git a/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
>> b/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
>> new file mode 100644
>> index 0000000..f4ef536
>> --- /dev/null
>> +++ b/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
>> @@ -0,0 +1,45 @@
>> +SECTION = "net/misc"
>> +DESCRIPTION = "Ddclient is a Perl client used to update dynamic DNS
>> entries for accounts on Dynamic DNS Network Services"
>> +HOMEPAGE = "http://ddclient.sourceforge.net/"
>> +LICENSE = "GPLv2"
>> +
>> +SRC_URI = "\
>> +    ${SOURCEFORGE_MIRROR}/ddclient/ddclient-${PV}.tar.bz2 \
>> +    file://ip-up"
>> +
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
>> +
>> +RDEPENDS_${PN} = "\
>> +    perl-module-getopt-long \
>> +    perl-module-sys-hostname \
>> +    perl-module-io-socket \
>> +    perl-module-vars \
>> +    perl-module-overload \
>> +    perl-module-overloading \
>> +    perl-module-config \
>> +    perl-module-integer \
>> +    perl-module-exporter-heavy \
>> +    perl-module-symbol \
>> +    perl-module-selectsaver \
>> +    bash \
>> +    perl \
>> +    libio-socket-ssl-perl"
>> +
>> +do_install() {
>> +    install -d ${D}${sbindir} ${D}${sysconfdir}/ddclient
>> ${D}${sysconfdir}/init.d ${D}${sysconfdir}/default/persistent
>> +    install -d ${D}${sysconfdir}/ppp/ip-up.d/ install -d
>> ${D}${docdir}/ddclient
>> +    install -m 755 ${S}/ddclient ${D}${sbindir}
>> +    install ${S}/sample-etc_ddclient.conf ${D}${sysconfdir}/ddclient/ddc
>> lient.conf
>> +    install -m 755 ${WORKDIR}/ip-up ${D}${sysconfdir}/ppp/ip-up.d/
>> ddclient
>> +    install -m 0644 ${WORKDIR}/persistent ${D}/${sysconfdir}/default/per
>> sistent/50_ddclient
>> +    sed -e 's|/etc/ddclient.conf|/etc/ddclient/ddclient.conf|g'
>> ${S}/sample-etc_rc.d_init.d_ddclient > ${S}/rc_init
>> +    install -m 755 ${S}/rc_init ${D}${sysconfdir}/init.d/ddclient
>> +    install ${S}/README* ${D}${docdir}/ddclient
>> +    install ${S}/COPY* ${D}${docdir}/ddclient
>> +    install ${S}/sample* ${D}${docdir}/ddclient
>> +}
>> +
>> +CONFFILES_${PN} = "${sysconfdir}/ddclient/ddclient.conf"
>> +
>> +SRC_URI[md5sum] = "3b426ae52d509e463b42eeb08fb89e0b"
>> +SRC_URI[sha256sum] = "d40e2f1fd3f4bff386d27bbdf4b86
>> 45199b1995d27605a886b8c71e44d819591"
>> diff --git a/meta-networking/recipes-daemons/ddclient/files/ip-up
>> b/meta-networking/recipes-daemons/ddclient/files/ip-up
>> new file mode 100644
>> index 0000000..4411db9
>> --- /dev/null
>> +++ b/meta-networking/recipes-daemons/ddclient/files/ip-up
>> @@ -0,0 +1,4 @@
>> +#!/bin/sh
>> +
>> +logger -t ddclient $PPP_IFACE $PPP_LOCAL
>> +ddclient -daemon=0 -syslog -use=if -if=$PPP_IFACE >/dev/null 2>&1
>> diff --git a/meta-networking/recipes-daemons/ddclient/files/persistent
>> b/meta-networking/recipes-daemons/ddclient/files/persistent
>> new file mode 100644
>> index 0000000..b721272
>> --- /dev/null
>> +++ b/meta-networking/recipes-daemons/ddclient/files/persistent
>> @@ -0,0 +1 @@
>> +l root root 0644 /etc/ddclient.conf /var/persistent/etc/ddclient.conf
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

