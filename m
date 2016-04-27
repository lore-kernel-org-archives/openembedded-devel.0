Return-Path: <asselsm@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0492060017
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 18:30:52 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id c189so535934vkb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 11:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to;
	bh=GjvxjZES64sAEt0oxw1VvSKWRvMGJK5kagIyTsoPYk4=;
	b=gtlbCLcYGKFeaUfMq94A/RnEm+sQm2eTY+xXkL8WdIugrP9wpWQQ4O04PA5ddzUY66
	Y240AvRN/Hqc/I9z6kmuAWSzbtyxHLce0lUvWsfIWnJs0whLygViflkm7hg7mn1h5OOE
	/ztRdlSDkNo85dQ1vFg84Sl7TolqRgTtDjICbDPrN8Dlngiq+Q44JmFeH4uePYxZ0WP0
	9n34Jy8Bdnkq1rNHngNLtWnK/8j6DqJUs8QMx6/K0L5Ho8rd/b4f8HQDAOM1gXs5BHq2
	2APBcyRH+A1itnuXoVyYLXkZvKP8oedea/l1EUe59iFgDbAbFO5XZQmS48pR8uSqnX7n
	mcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:date:message-id:subject:from:to;
	bh=GjvxjZES64sAEt0oxw1VvSKWRvMGJK5kagIyTsoPYk4=;
	b=mhfJEeQK5RZEEUQ5q92SCS7dSXS9f5DGblc/UR2acDAzgEjTA+vrrS5UxuVqUgZ9yf
	hoTP37MhKccMgqywqWY8g1b15+MZGy8R44HxqrrNZRZxeimc90AtrSW7YmvnMagdt029
	ruJSt4lc9iMzul6hxc+lpotBJfQSmOAfaH96UPTj0S/+qank5kjXuD/gOgKRkvXweBcA
	SQ0H1hY5qMWmUxTvYIVV/Hv2OOqmo8H1m0i6ATvDxqw5LJENOZdFo443gwrZys1TXC0p
	t2RHAsOfPVDnBS8tDzvZxf7sAg0JeLR0EzampRZm6LZfxXXqabgvx6rQ01lWI4S4k5WH
	Ylig==
X-Gm-Message-State: AOPr4FX+8dFVt2ByJtV41wxun5f8diSIkS2ROkTb7sgzay26mEnLEWL5gZFZcpmxOg9AJSjAASjOlFqSehfwDg==
MIME-Version: 1.0
X-Received: by 10.31.92.151 with SMTP id q145mr329585vkb.42.1461781853125;
	Wed, 27 Apr 2016 11:30:53 -0700 (PDT)
Reply-To: mark.asselstine@windriver.com
Sender: asselsm@gmail.com
Received: by 10.159.55.142 with HTTP; Wed, 27 Apr 2016 11:30:53 -0700 (PDT)
In-Reply-To: <20160420130613.GA5528@mentor.com>
References: <1461013253-2350-1-git-send-email-joe_macdonald@mentor.com>
	<1461013253-2350-6-git-send-email-joe_macdonald@mentor.com>
	<20160419091558.GA2562@jama> <20160419130107.GA5970@mentor.com>
	<20160420092756.GC2561@jama> <20160420130613.GA5528@mentor.com>
Date: Wed, 27 Apr 2016 14:30:53 -0400
X-Google-Sender-Auth: _9xnAZeE_Gk8VJ4vw7erKQBy6Js
Message-ID: <CAPuovEJqNXWj2N1t8t5Z=oRBVtJAKGtzAjJrznWQ=zyqGz87bw@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
To: openembedded-devel@lists.openembedded.org, Joe_MacDonald@mentor.com
Subject: Re: [meta-networking][PATCH 5/5] samba: Update to latest stable
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
X-List-Received-Date: Wed, 27 Apr 2016 18:30:57 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 20, 2016 at 9:06 AM, Joe MacDonald <Joe_MacDonald@mentor.com> wrote:
> [Re: [oe] [meta-networking][PATCH 5/5] samba: Update to latest stable] On 16.04.20 (Wed 11:27) Martin Jansa wrote:
>
>> On Tue, Apr 19, 2016 at 09:01:25AM -0400, Joe MacDonald wrote:
>> > [Re: [oe] [meta-networking][PATCH 5/5] samba: Update to latest stable] On 16.04.19 (Tue 11:15) Martin Jansa wrote:
>> >
>> > > On Mon, Apr 18, 2016 at 05:00:53PM -0400, Joe MacDonald wrote:
>> > > > The previous version of Samba had many critical security updates that
>> > > > would've required significant backporting effort.  Update to the latest
>> > > > stable release instead.
>> > >
>> > > Does it fix floating dependency on libpam as well?
>> >
>> > It does not, unfortunately.  After an embarrassingly long time with this
>> > I thought it would be best to carry it this far, integrate the
>> > outstanding patches against it, then tackle the libpam dependency issue.
>> > Since I know you've sunk a lot of time into this recently I know you
>> > know all too well what a tangle the samba build and dependency checking
>> > system can be.
>>
>> Agreed that it can be resolved in follow-up patch.
>>
>> > It at least meets the criteria of "better than I found it", I think.
>>
>> Partially agree, but first please fix this one found in last world build:
>

I am seeing an issue that I believe is related to this uprev. I am
getting rootfs generation issues:

Preparing...                    ######################################## [  0%]
warning: Removing ctdb-2.5.1-r0@core2_64 due to file /usr/bin/ctdb
conflicting with samba-4.4.2-r0@core2_64
error: ctdb-dev-2.5.1-r0 conflicts with ctdb = 2.5.1-r0

Looking at the relationship between samba and ctdb it appears that the
landscape has changed some starting in version 4.2. Samba now includes
and installs ctdb instead of relying on stand-alone ctdb. Referencing
https://wiki.samba.org/index.php/CTDB_Setup we see this activated by
'--with-cluster-support'  which we do pass to configure based on the
bb.

Dropping the DEPENDS on ctdb resolves this issue. Any thoughts on
this, should I just send a patch with the above or is there other
considerations I am missing?

Mark



> Got it, I've fixed that in my tree by removing the --without-pam_smbpass
> option from line 46 of the samba recipe.  In the interests of not
> sending out yet another giant patch with one tiny change in it to the
> list, here's my current merge queue:
>
> The following changes since commit ab62c7437ff28d045ecff3f82621990ff94662e6:
>
>   cyrus-sasl: Drop unneeded group addition (2016-04-19 09:31:39 -0400)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/meta-openembedded-contrib joeythesaint/meta-networking-next
>
> for you to fetch changes up to 5182767a3a84491394a54708d5e06d31d59b7c1e:
>
>   vpnc: stage vpnc-script (2016-04-20 08:55:44 -0400)
>
> ----------------------------------------------------------------
> Armin Kuster (1):
>       c-ares: Add package to networking
>
> Christopher Larson (3):
>       ctdb: disable the service by default
>       ctdb: rdepend on procps
>       ctdb: drop duplicated DESCRIPTION
>
> Fabio Berton (1):
>       lldpd: Update to version 0.9.2
>
> Ioan-Adrian Ratiu (2):
>       openconnect: add recipe
>       vpnc: stage vpnc-script
>
> Jagadeesh Krishnanjanappa (1):
>       iscsitarget: resolve build error with linux kernel 4.3 and above
>
> Joe MacDonald (5):
>       samba: Update to latest stable
>       libldb: Update to latest stable
>       libtevent: Update to latest stable
>       libtdb: Update to latest stable
>       libtalloc: Update to latest stable
>
> Johannes Pointner (1):
>       samba: add volatile file to support readonly rootfs
>
> Mark Asselstine (1):
>       dnsmasq: get systemd only working again
>
>  .../openconnect/openconnect_git.bb                 |    18 +
>  ...1-waf-sanitize-and-fix-added-cross-answer.patch |    60 -
>  ...-Adds-a-new-mode-to-samba-cross-compiling.patch |   112 -
>  ...-readability-of-cross-answers-generated-b.patch |    66 -
>  ...wafsamba-CHECK_SIZEOF-cross-compile-frien.patch |    72 -
>  .../0005-build-unify-and-fix-endian-tests.patch    |   169 -
>  ...sing-of-cross-answers-file-in-case-answer.patch |    36 -
>  .../samba-4.1.12/01-fix-force-user-sec-ads.patch   |  1448 -
>  .../samba/samba-4.1.12/02-fix-ipv6-join.patch      |   266 -
>  .../samba-4.1.12/03-net-ads-kerberos-pac.patch     |   962 -
>  .../samba/samba-4.1.12/04-ipv6-workaround.patch    |   211 -
>  .../05-fix-gecos-field-with-samlogon.patch         | 29894 -------------------
>  .../06-fix-nmbd-systemd-status-update.patch        |    97 -
>  .../07-fix-idmap-ad-getgroups-without-gid.patch    |    42 -
>  .../08-fix-idmap-ad-sfu-with-trusted-domains.patch |    44 -
>  .../09-fix-smbclient-echo-cmd-segfault.patch       |    35 -
>  ...improve-service-principal-guessing-in-net.patch |   180 -
>  ...x-overwriting-of-spns-during-net-ads-join.patch |   329 -
>  ...ted-spns-from-AD-during-keytab-generation.patch |   159 -
>  .../samba/samba-4.1.12/13-fix-aes-enctype.patch    |   988 -
>  .../samba/samba-4.1.12/14-fix-dnsupdate.patch      |    51 -
>  .../15-fix-netbios-name-truncation.patch           |   154 -
>  .../16-do-not-check-xsltproc-manpages.patch        |    52 -
>  .../samba-4.1.12/17-execute-prog-by-qemu.patch     |    22 -
>  .../18-avoid-get-config-by-native-ncurses.patch    |    22 -
>  ...systemd-daemon-is-contained-by-libsystemd.patch |    42 -
>  .../samba-4.1.12/21-avoid-sasl-unless-wanted.patch |    10 -
>  .../00-fix-typos-in-man-pages.patch                |     0
>  ...006-avoid-using-colon-in-the-checking-msg.patch |     0
>  .../16-do-not-check-xsltproc-manpages.patch        |    43 +
>  ...-import-target-module-while-cross-compile.patch |    19 +-
>  .../21-add-config-option-without-valgrind.patch    |     0
>  .../samba/samba-4.4.2/volatiles.03_samba           |     3 +
>  .../samba/{samba_4.1.12.bb => samba_4.4.2.bb}      |    82 +-
>  .../recipes-connectivity/vpnc/vpnc_0.5.3.bb        |     7 +
>  .../lldpd/{lldpd_0.9.0.bb => lldpd_0.9.2.bb}       |     4 +-
>  ...pdated_bio_struct_of_linux_v4.3_and_above.patch |    75 +
>  .../iscsitarget/iscsitarget_1.4.20.3+svn502.bb     |     8 +-
>  .../recipes-support/c-ares/c-ares_1.11.0.bb        |    13 +
>  meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb |    11 +-
>  .../recipes-support/dnsmasq/files/dnsmasq.service  |     7 +-
>  ...-import-target-module-while-cross-compile.patch |    19 +-
>  .../libldb/{libldb_1.1.21.bb => libldb_1.1.26.bb}  |     4 +-
>  .../{libtalloc_2.1.3.bb => libtalloc_2.1.6.bb}     |     5 +-
>  .../libtdb/{libtdb_1.3.7.bb => libtdb_1.3.8.bb}    |     4 +-
>  .../{libtevent_0.9.25.bb => libtevent_0.9.28.bb}   |     4 +-
>  46 files changed, 231 insertions(+), 35618 deletions(-)
>  create mode 100644 meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/0001-waf-sanitize-and-fix-added-cross-answer.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/0002-Adds-a-new-mode-to-samba-cross-compiling.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/0003-waf-improve-readability-of-cross-answers-generated-b.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/0004-build-make-wafsamba-CHECK_SIZEOF-cross-compile-frien.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/0005-build-unify-and-fix-endian-tests.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/0007-waf-Fix-parsing-of-cross-answers-file-in-case-answer.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/01-fix-force-user-sec-ads.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/02-fix-ipv6-join.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/03-net-ads-kerberos-pac.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/04-ipv6-workaround.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/05-fix-gecos-field-with-samlogon.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/06-fix-nmbd-systemd-status-update.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/07-fix-idmap-ad-getgroups-without-gid.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/08-fix-idmap-ad-sfu-with-trusted-domains.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/09-fix-smbclient-echo-cmd-segfault.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/10-improve-service-principal-guessing-in-net.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/11-fix-overwriting-of-spns-during-net-ads-join.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/12-add-precreated-spns-from-AD-during-keytab-generation.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/13-fix-aes-enctype.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/14-fix-dnsupdate.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/15-fix-netbios-name-truncation.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/16-do-not-check-xsltproc-manpages.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/17-execute-prog-by-qemu.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/18-avoid-get-config-by-native-ncurses.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/19-systemd-daemon-is-contained-by-libsystemd.patch
>  delete mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/21-avoid-sasl-unless-wanted.patch
>  rename meta-networking/recipes-connectivity/samba/{samba-4.1.12 => samba-4.4.2}/00-fix-typos-in-man-pages.patch (100%)
>  rename meta-networking/recipes-connectivity/samba/{samba-4.1.12 => samba-4.4.2}/0006-avoid-using-colon-in-the-checking-msg.patch (100%)
>  create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.4.2/16-do-not-check-xsltproc-manpages.patch
>  rename meta-networking/recipes-connectivity/samba/{samba-4.1.12 => samba-4.4.2}/20-do-not-import-target-module-while-cross-compile.patch (79%)
>  mode change 100755 => 100644
>  rename meta-networking/recipes-connectivity/samba/{samba-4.1.12 => samba-4.4.2}/21-add-config-option-without-valgrind.patch (100%)
>  create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.4.2/volatiles.03_samba
>  rename meta-networking/recipes-connectivity/samba/{samba_4.1.12.bb => samba_4.4.2.bb} (82%)
>  rename meta-networking/recipes-daemons/lldpd/{lldpd_0.9.0.bb => lldpd_0.9.2.bb} (94%)
>  create mode 100644 meta-networking/recipes-extended/iscsitarget/files/build_with_updated_bio_struct_of_linux_v4.3_and_above.patch
>  create mode 100644 meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb
>  rename meta-networking/recipes-support/libldb/{libldb_1.1.21.bb => libldb_1.1.26.bb} (92%)
>  rename meta-networking/recipes-support/libtalloc/{libtalloc_2.1.3.bb => libtalloc_2.1.6.bb} (91%)
>  rename meta-networking/recipes-support/libtdb/{libtdb_1.3.7.bb => libtdb_1.3.8.bb} (87%)
>  rename meta-networking/recipes-support/libtevent/{libtevent_0.9.25.bb => libtevent_0.9.28.bb} (88%)
>
> Still trying to test this queue out before merging upstream, but it
> might happen today if all goes well.
>
> -J.
>
>>
>> ERROR: samba-4.4.2-r0 do_configure: Function failed: do_configure (log file is located at /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/samba/4.4.2-r0/temp/log.do_configure.1777)
>> ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/samba/4.4.2-r0/temp/log.do_configure.1777
>> Log data follows:
>> | DEBUG: Executing python function sysroot_cleansstate
>> | DEBUG: Python function sysroot_cleansstate finished
>> | DEBUG: Executing shell function do_configure
>> | waf [command] [options]
>> |
>> | Main commands (example: ./waf build -j4)
>> |   build       : build all targets
>> |   clean       : removes the build files
>> |   configure   : configures the project
>> |   ctags       : build 'tags' file using ctags
>> |   dist        : makes a tarball for distribution
>> |   distcheck   : test that distribution tarball builds and installs
>> |   distclean   : removes the build directory
>> |   etags       : build TAGS file using etags
>> |   install     : installs the build files
>> |   pep8        : run pep8 validator
>> |   pydoctor    : build python apidocs
>> |   reconfigure : reconfigure if config scripts have changed
>> |   test        : Run the test suite (see test options below)
>> |   testonly    : run tests without doing a build first
>> |   uninstall   : removes the installed files
>> |   wafdocs     : build wafsamba apidocs
>> |   wildcard_cmd: called on a unknown command
>> |
>> | waf: error: no such option: --without-pam_smbpass
>> | WARNING: exit code 1 from a shell command.
>> | ERROR: Function failed: do_configure (log file is located at /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/samba/4.4.2-r0/temp/log.do_configure.1777)
>> NOTE: recipe samba-4.4.2-r0: task do_configure: Failed
>> ERROR: Task 20263 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb, do_configure) failed with exit code '1'
>
>
> --
> -Joe MacDonald.
> :wq
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

