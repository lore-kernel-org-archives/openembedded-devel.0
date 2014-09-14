Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0BBD560144
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Sep 2014 04:13:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8E4Dek4000528
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Sep 2014 21:13:41 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Sat, 13 Sep 2014 21:13:39 -0700
Message-ID: <541515F2.5030607@windriver.com>
Date: Sun, 14 Sep 2014 12:13:38 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <cover.1410279874.git.liezhi.yang@windriver.com>	<63e89adc5ffc2c1e30a4b2a41ca0988e95158554.1410279874.git.liezhi.yang@windriver.com>	<54108595.6080809@topic.nl>	<5411BFA4.4050206@windriver.com>
	<5412EDC0.8090000@topic.nl>
In-Reply-To: <5412EDC0.8090000@topic.nl>
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
X-List-Received-Date: Sun, 14 Sep 2014 04:13:45 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Mike,

I've updated the patch in the repo:

git://git.openembedded.org/meta-openembedded-contrib rbt/rdeps

And used a patch rather than sed command since patch is preferred, here
is the patch with your signed off:

diff --git 
a/meta-networking/recipes-daemons/autofs/autofs-5.1.0/remove-bashism.patch 
b/meta-networking/recipes-daemons/autofs/autofs-5.1.0/remove-bashism.patch
new file mode 100644
index 0000000..282d6f0
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.1.0/remove-bashism.patch
@@ -0,0 +1,120 @@
+From 79034f969bbd12215d65b4337dfd38a13d02d4ef Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Sat, 13 Sep 2014 20:19:28 -0700
+Subject: [PATCH] autofs.init.in: remove bashism
+
+It can work without the bashism.
+
+Upstream-Status: Pending
+
+Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ redhat/autofs.init.in |   12 ++++++------
+ samples/rc.autofs.in  |   10 +++++-----
+ 2 files changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/redhat/autofs.init.in b/redhat/autofs.init.in
+index 9d008ff..4f1c0d8 100644
+--- a/redhat/autofs.init.in
++++ b/redhat/autofs.init.in
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ #
+ # rc file for automount using a Sun-style "master map".
+ #
+@@ -42,7 +42,7 @@ if [ -r $confdir/autofs ]; then
+       . $confdir/autofs
+ fi
+
+-function start() {
++start() {
+       # Make sure autofs4 module is loaded
+       if ! grep -q autofs /proc/filesystems

+       then
+@@ -102,7 +102,7 @@ function start() {
+       return $RETVAL
+ }
+
+-function stop() {
++stop() {
+       echo -n $"Stopping $prog: "
+       count=0
+       while [ -n "`pidof $prog`" -a $count -lt 15 ] ; do
+@@ -125,7 +125,7 @@ function stop() {
+       return $RETVAL
+ }
+
+-function restart() {
++restart() {
+       status autofs > /dev/null 2>&1
+       if [ $? -eq 0 ]; then
+               stop
+@@ -143,7 +143,7 @@ function restart() {
+       start
+ }
+
+-function reload() {
++reload() {
+       if [ ! -f /var/lock/subsys/autofs ]; then
+               echo $"$prog not running"
+               RETVAL=1
+@@ -161,7 +161,7 @@ function reload() {
+       return $RETVAL
+ }
+
+-function usage_message() {
++usage_message() {
+       echo $"Usage: $0 
{start|forcestart|stop|status|restart|force-reload|forcerestart|reload|condrestart|try-restart|usage}"
+ }
+
+diff --git a/samples/rc.autofs.in b/samples/rc.autofs.in
+index 487669f..e96cde1 100644
+--- a/samples/rc.autofs.in
++++ b/samples/rc.autofs.in
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ #
+ # rc file for automount using a Sun-style "master map".
+ #
+@@ -36,7 +36,7 @@ if [ -r $confdir/autofs ]; then
+       . $confdir/autofs
+ fi
+
+-function start() {
++start() {
+       echo -n "Starting $prog: "
+
+       # Make sure autofs4 module is loaded
+@@ -85,7 +85,7 @@ function start() {
+       return $RETVAL
+ }
+
+-function stop() {
++stop() {
+       echo -n $"Stopping $prog: "
+       count=0
+       while [ -n "`pidof $prog`" -a $count -lt 15 ] ; do
+@@ -102,7 +102,7 @@ function stop() {
+       return $RETVAL
+ }
+
+-function restart() {
++restart() {
+       stop
+       while [ -n "`pidof $prog`" ] ; do
+               sleep 5
+@@ -110,7 +110,7 @@ function restart() {
+       start
+ }
+
+-function reload() {
++reload() {
+       pid=`pidof $prog`
+       if [ -z $pid ]; then
+               echo $"$prog not running"
+--
+1.7.9.5
+
diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb 
b/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
index aab2187..13af2fe 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
@@ -19,6 +19,7 @@ SRC_URI = 
"${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.gz \
             file://add-the-needed-stdarg.h.patch \
             file://using-pkg-config-to-detect-libxml-2.0-and-krb5.patch \
             file://force-STRIP-to-emtpy.patch \
+           file://remove-bashism.patch \
  "

  SRC_URI[md5sum] = "b7724a9a55923f3c06933a8dfd1e79d3"



// Robert

On 09/12/2014 08:57 PM, Mike Looijmans wrote:
> On 09/11/2014 05:28 PM, Robert Yang wrote:
>>
>>
>> On 09/11/2014 01:08 AM, Mike Looijmans wrote:
>>> Wouldn't it be a LOT more constructive to fix the bashism. I fail to
>>> see the
>>> virtue in adding 2MB of "bash" to an embedded system just for a text echo
>>> statement that no-one will actually read unless they hook up a serial
>>> console to
>>> their TV set or so.
>>
>> The problem is that there are more bashism, here is the full list:
>>
>> possible bashism in autofs/etc/init.d/autofs line 39 ('function' is
>> useless):
>> function start() {
>> possible bashism in autofs/etc/init.d/autofs line 52 ([^] should be [!]):
>>          elif ([ -f /proc/modules ] && lsmod) | grep -q autofs[^4]
>> possible bashism in autofs/etc/init.d/autofs line 88 ('function' is
>> useless):
>> function stop() {
>> possible bashism in autofs/etc/init.d/autofs line 89 ($"foo" should be
>> eval_gettext "foo"):
>>          echo -n $"Stopping $prog: "
>> possible bashism in autofs/etc/init.d/autofs line 92 (should be >word
>> 2>&1):
>>                  killall -TERM $prog >& /dev/null
>> possible bashism in autofs/etc/init.d/autofs line 105 ('function' is
>> useless):
>> function restart() {
>> possible bashism in autofs/etc/init.d/autofs line 113 ('function' is
>> useless):
>> function reload() {
>> possible bashism in autofs/etc/init.d/autofs line 116 ($"foo" should be
>> eval_gettext "foo"):
>>                  echo $"$prog not running"
>> possible bashism in autofs/etc/init.d/autofs line 120 ($"foo" should be
>> eval_gettext "foo"):
>>                  echo $"Reloading maps"
>> possible bashism in autofs/etc/init.d/autofs line 150 ($"foo" should be
>> eval_gettext "foo"):
>>                  echo $"Usage: $0
>> {start|forcestart|stop|restart|forcerestart|reload}"
>>
>> // Robert
>>
>
> I put the following in a bbappend to work around the bashism, this was enough to
> make the scripts work just fine with busybox's shell:
>
>
> # Remove bash scripting from init script (meaning, remove "function"
> # from each shell function)
> do_configure_prepend () {
>      for bashfile in redhat/autofs.init.in samples/rc.autofs.in
>      do
>          sed -i 's.#!/bin/bash.#!/bin/sh.' $bashfile
>          sed -i 's/^function //g' $bashfile
>      done
> }
>
>
> I wanted to point to the commit on sourceforge, but the site is unresponsive at
> the moment.
>
>>>
>>>
>>> On 9-9-2014 18:27, Robert Yang wrote:
>>>> Bashism:
>>>> [snip]
>>>> possible bashism in autofs/etc/init.d/autofs line 116 ($"foo" should be
>>>> eval_gettext "foo"):
>>>>                  echo $"$prog not running"
>>>> possible bashism in autofs/etc/init.d/autofs line 120 ($"foo" should be
>>>> eval_gettext "foo"):
>>>>                  echo $"Reloading maps"
>>>> possible bashism in autofs/etc/init.d/autofs line 150 ($"foo" should be
>>>> eval_gettext "foo"):
>>>>                  echo $"Usage: $0
>>>> {start|forcestart|stop|restart|forcerestart|reload}"
>>>> [snip]
>>>>
>>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>>> ---
>>>>   .../recipes-daemons/autofs/autofs_5.1.0.bb         |    1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
>>>> b/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
>>>> index aab2187..06ee77b 100644
>>>> --- a/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
>>>> +++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
>>>> @@ -4,6 +4,7 @@ LICENSE = "GPL-2.0"
>>>>   LIC_FILES_CHKSUM =
>>>> "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
>>>>
>>>>   DEPENDS += "libtirpc flex-native bison-native"
>>>> +RDEPENDS_${PN} += "bash"
>>>>
>>>>   inherit autotools-brokensep systemd
>>>>
>>>>
>>>
>>>
>
>

