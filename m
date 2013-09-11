Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3598F6147C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2013 00:33:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8B0XXil014927
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2013 17:33:33 -0700 (PDT)
Received: from [128.224.22.39] (128.224.22.39) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 10 Sep 2013 17:33:33 -0700
Message-ID: <522FBA5A.3090305@windriver.com>
Date: Tue, 10 Sep 2013 20:33:30 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
X-Originating-IP: [128.224.22.39]
Cc: Joe MacDonald <joe.macdonald@windriver.com>
Subject: [meta-webserver] Update to standalone tree
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
X-List-Received-Date: Wed, 11 Sep 2013 00:33:32 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

I have just done the same thing to meta-webserver
as Joe did to meta-networking so for all the text below:

     s/meta-networking/meta-webserver/g

I haven't updated Joe commit example but I used his script so
the tracking and format will be similar.

// Randy


Joe's original message:
-------------------------------------------------------------


    If you are only using meta-networking from meta-openembedded, you
    need read no further.  This is only for people using my side-project
    on github.  Absolutely nothing has changed in the official
    meta-networking.



For anyone using the standalone meta-networking subtree I maintain on
github, please be aware that I've made a change to the way I create the
subtree which, unfortunately, will result in a forced update for all of
your branches.  And probably a merge on whatever branch you happen to be
on already (eg. master).  If you get into that scenario, I suggest
pushing your current branch with the merge in it off a cliff and
re-creating the current branch tracking the up-stream.  If you're not in
the habit of doing a git-pull, though, this will probably be cleaner:

    % git fetch --all --tags ; git rebase origin/<up-stream-branch-name

The reason for this (and the advantage) has been in response to requests
I've had to preserve the original (that is, meta-oe) commit hash so it
is easy to connect a commit in the standalone meta-networking with the
official meta-networking I maintain as a part of the larger meta-oe.
The change is small and hopefully self-explanatory, but I won't let that 
stop
me.

Before:

commit a0f9363caddbfb92212b4bf5d4a2590c451b7cef
Author: Roy.Li <rongqing.li@windriver.com>
Date:   Fri Jul 19 10:19:25 2013 +0800

     Upgrade vsftpd to 3.0.0
         Upgrade vsftpd to 3.0.0 with below modification:
     1. more strict access limitation, like: do not allow anonymous access
     2. use vsftpd.ftpusers and vsftpd.user_list to confine user access
     3. enable pam if DISTRO_FEATURE includes pam
     4. enable tcp-wrapper
     5. install vsftpd.conf with 0600 permission, not 0755
         Signed-off-by: Roy.Li <rongqing.li@windriver.com>
     Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>

After:

commit b188e402a04db35424e22cb2b2100b7070648948
Author: Roy.Li <rongqing.li@windriver.com>
Date:   Fri Jul 19 10:19:25 2013 +0800

     Upgrade vsftpd to 3.0.0
           (original commit: 441502b68d03a4ce7796436a53c5e95399724ad2)
         Upgrade vsftpd to 3.0.0 with below modification:
     1. more strict access limitation, like: do not allow anonymous access
     2. use vsftpd.ftpusers and vsftpd.user_list to confine user access
     3. enable pam if DISTRO_FEATURE includes pam
     4. enable tcp-wrapper
     5. install vsftpd.conf with 0600 permission, not 0755
         Signed-off-by: Roy.Li <rongqing.li@windriver.com>
     Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>

Where 441502b6... is the commit in meta-oe from Roy that happens to
upgrade vsftpd.

FWIW, I don't anticipate doing anything destructive like this again.

--------------------------------------------------------------------

// Randy



