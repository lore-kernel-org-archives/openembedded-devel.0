Return-Path: <mike.looijmans@topic.nl>
Received: from smtp08.online.nl (smtp08.online.nl [194.134.42.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7FE1E65CE7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Sep 2014 12:57:37 +0000 (UTC)
Received: from smtp08.online.nl (localhost [127.0.0.1])
	by smtp08.online.nl (Postfix) with ESMTP id C14266618C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Sep 2014 14:57:36 +0200 (CEST)
Received: from [192.168.1.6] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp08.online.nl (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Sep 2014 14:57:36 +0200 (CEST)
Message-ID: <5412EDC0.8090000@topic.nl>
Date: Fri, 12 Sep 2014 14:57:36 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1410279874.git.liezhi.yang@windriver.com>	<63e89adc5ffc2c1e30a4b2a41ca0988e95158554.1410279874.git.liezhi.yang@windriver.com>	<54108595.6080809@topic.nl>
	<5411BFA4.4050206@windriver.com>
In-Reply-To: <5411BFA4.4050206@windriver.com>
X-Online-Scanned: by Cloudmark authority (on smtp08.online.nl)
Subject: Re: [PATCH 02/14] autofs: add bash to RDEPENDS_autofs
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
X-List-Received-Date: Fri, 12 Sep 2014 12:57:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2014 05:28 PM, Robert Yang wrote:
>
>
> On 09/11/2014 01:08 AM, Mike Looijmans wrote:
>> Wouldn't it be a LOT more constructive to fix the bashism. I fail to
>> see the
>> virtue in adding 2MB of "bash" to an embedded system just for a text echo
>> statement that no-one will actually read unless they hook up a serial
>> console to
>> their TV set or so.
>
> The problem is that there are more bashism, here is the full list:
>
> possible bashism in autofs/etc/init.d/autofs line 39 ('function' is
> useless):
> function start() {
> possible bashism in autofs/etc/init.d/autofs line 52 ([^] should be [!]):
>          elif ([ -f /proc/modules ] && lsmod) | grep -q autofs[^4]
> possible bashism in autofs/etc/init.d/autofs line 88 ('function' is
> useless):
> function stop() {
> possible bashism in autofs/etc/init.d/autofs line 89 ($"foo" should be
> eval_gettext "foo"):
>          echo -n $"Stopping $prog: "
> possible bashism in autofs/etc/init.d/autofs line 92 (should be >word
> 2>&1):
>                  killall -TERM $prog >& /dev/null
> possible bashism in autofs/etc/init.d/autofs line 105 ('function' is
> useless):
> function restart() {
> possible bashism in autofs/etc/init.d/autofs line 113 ('function' is
> useless):
> function reload() {
> possible bashism in autofs/etc/init.d/autofs line 116 ($"foo" should be
> eval_gettext "foo"):
>                  echo $"$prog not running"
> possible bashism in autofs/etc/init.d/autofs line 120 ($"foo" should be
> eval_gettext "foo"):
>                  echo $"Reloading maps"
> possible bashism in autofs/etc/init.d/autofs line 150 ($"foo" should be
> eval_gettext "foo"):
>                  echo $"Usage: $0
> {start|forcestart|stop|restart|forcerestart|reload}"
>
> // Robert
>

I put the following in a bbappend to work around the bashism, this was 
enough to make the scripts work just fine with busybox's shell:


# Remove bash scripting from init script (meaning, remove "function"
# from each shell function)
do_configure_prepend () {
	for bashfile in redhat/autofs.init.in samples/rc.autofs.in
	do
		sed -i 's.#!/bin/bash.#!/bin/sh.' $bashfile
		sed -i 's/^function //g' $bashfile
	done
}


I wanted to point to the commit on sourceforge, but the site is 
unresponsive at the moment.

>>
>>
>> On 9-9-2014 18:27, Robert Yang wrote:
>>> Bashism:
>>> [snip]
>>> possible bashism in autofs/etc/init.d/autofs line 116 ($"foo" should be
>>> eval_gettext "foo"):
>>>                  echo $"$prog not running"
>>> possible bashism in autofs/etc/init.d/autofs line 120 ($"foo" should be
>>> eval_gettext "foo"):
>>>                  echo $"Reloading maps"
>>> possible bashism in autofs/etc/init.d/autofs line 150 ($"foo" should be
>>> eval_gettext "foo"):
>>>                  echo $"Usage: $0
>>> {start|forcestart|stop|restart|forcerestart|reload}"
>>> [snip]
>>>
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> ---
>>>   .../recipes-daemons/autofs/autofs_5.1.0.bb         |    1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
>>> b/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
>>> index aab2187..06ee77b 100644
>>> --- a/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
>>> +++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
>>> @@ -4,6 +4,7 @@ LICENSE = "GPL-2.0"
>>>   LIC_FILES_CHKSUM =
>>> "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
>>>
>>>   DEPENDS += "libtirpc flex-native bison-native"
>>> +RDEPENDS_${PN} += "bash"
>>>
>>>   inherit autotools-brokensep systemd
>>>
>>>
>>
>>


-- 
Mike Looijmans

