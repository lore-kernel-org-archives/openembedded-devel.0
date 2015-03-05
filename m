Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DD2B665C7B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 07:57:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t257vrsX015769
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 Mar 2015 23:57:54 -0800 (PST)
Received: from [128.224.162.201] (128.224.162.201) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Mar 2015 23:57:53 -0800
Message-ID: <54F80C7F.9040301@windriver.com>
Date: Thu, 5 Mar 2015 15:57:51 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Joe MacDonald <Joe_MacDonald@mentor.com>
References: <1423042412-17651-1-git-send-email-wenzong.fan@windriver.com>
	<20150212021749.GK30457@mentor.com>
	<54F6B37C.6040706@windriver.com>
	<20150304133913.GA26456@mentor.com>
In-Reply-To: <20150304133913.GA26456@mentor.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-networking] iscsi-initiator-utils: fix SELinux label for initiatorname.iscsi
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
X-List-Received-Date: Thu, 05 Mar 2015 07:57:53 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/04/2015 09:39 PM, Joe MacDonald wrote:
> [Re: [oe] [PATCH][meta-networking] iscsi-initiator-utils: fix SELinux label for initiatorname.iscsi] On 15.03.04 (Wed 15:25) wenzong fan wrote:
>
>> On 02/12/2015 10:17 AM, Joe MacDonald wrote:
>>> Hey Wenzong,
>>>
>>> [[oe] [PATCH][meta-networking] iscsi-initiator-utils: fix SELinux label for initiatorname.iscsi] On 15.02.04 (Wed 17:33) wenzong.fan@windriver.com wrote:
>>>
>>>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>>>
>>>> * /etc/iscsi/initiatorname.iscsi: etc_runtime_t -> etc_t
>>>>
>>>> This config file was created by postinstall or initscript, fix SELinux
>>>> label for it to remove:
>>>>
>>>>    avc: denied { read } for pid=6094 comm="iscsid" \
>>>>    name="initiatorname.iscsi" dev="sda3" ino=1057846 \
>>>>    scontext=system_u:system_r:iscsid_t:s0-s15:c0.c1023 \
>>>>    tcontext=system_u:object_r:etc_runtime_t:s0 tclass=file
>>>
>>> Since this is an issue that only shows up when you have SELinux on your
>>> system and since it is tweaking a file that is manually installed by a
>>> do_install() in iscsi-initiator-utils, could you re-work this as a
>>> bbappend in meta-selinux?
>>
>> Hi Joe,
>>
>> This make sense, but there's an issue that meta-networking is not
>> depended by meta-selinux, adding a bbappend may block the building
>> of meta-selinux & oe-core only.
>>
>> Any suggestions about that?
>
> As a matter of fact, we just addressed that with
> d382d54f0a9a913791fca1d7f61e87fcfd32842b in meta-selinux a couple of
> weeks back.  There is still a mistake in that, but Philip has a patch
> for it that I'm integrating now, but the core idea works.  So your patch
> would go into a networking-layer/ hierarchy in meta-selinux/ and then it
> would either be picked up if meta-networking is included or ignored in
> the meta-selinux+oe-core-only scenario.

Cool, I've made the bbappend and sent meta-selinux patches to 
yocto@yoctoproject.org.

Thanks a lot!

Wenzong

>
> -J.
>
>>
>> Thanks
>> Wenzong
>>
>>>
>>> -J.
>>>
>>>>
>>>> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>>>> ---
>>>>   .../recipes-daemons/iscsi-initiator-utils/files/initd.debian          | 4 ++++
>>>>   1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/initd.debian b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/initd.debian
>>>> index 99a7638..43fb348 100644
>>>> --- a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/initd.debian
>>>> +++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/initd.debian
>>>> @@ -39,6 +39,10 @@ start() {
>>>>   InitiatorName=$INITIATORNAME
>>>>   EOF
>>>>   	fi
>>>> +
>>>> +	# Fix label for /etc/iscsi/initiatorname.iscsi if SELinux was enabled
>>>> +	test ! -x /sbin/restorecon || /sbin/restorecon -F /etc/iscsi/initiatorname.iscsi
>>>> +
>>>>   	start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON
>>>>   	RETVAL=$?
>>>>   	starttargets
>>>> --
>>>> 1.9.1
>>>>
>

