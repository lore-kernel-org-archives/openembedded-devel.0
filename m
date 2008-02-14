Received: from [209.85.128.188] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <philipp.zabel@gmail.com>) id 1JPg8N-0003ss-JZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Feb 2008 16:36:23 +0100
Received: by fk-out-0910.google.com with SMTP id 18so447220fks.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2008 07:36:14 -0800 (PST)
Received: by 10.82.187.2 with SMTP id k2mr2665229buf.19.1203003374235;
	Thu, 14 Feb 2008 07:36:14 -0800 (PST)
Received: by 10.82.118.18 with HTTP; Thu, 14 Feb 2008 07:36:14 -0800 (PST)
Message-ID: <74d0deb30802140736j45e629dfr717549c267c0db53@mail.gmail.com>
Date: Thu, 14 Feb 2008 16:36:14 +0100
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1JPfZq-0006fI-Ky@linuxtogo.org>
MIME-Version: 1.0
References: <E1JPfZq-0006fI-Ky@linuxtogo.org>
Subject: Re: [oe-commits] org.oe.dev angstrom 2008: start lockdown file based on openmoko versions
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Feb 2008 15:36:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Feb 14, 2008 at 4:00 PM, koen commit
<openembedded-commits@lists.openembedded.org> wrote:
> angstrom 2008: start lockdown file based on openmoko versions
>  * awaits bitbake support to get generated automatically
>
>  Author: koen@openembedded.org
>  Branch: org.openembedded.dev
>  Revision: 9f227060931d6ef3c46ac867c9d5ab6f7ff4c7b8
>  ViewMTN: http://monotone.openembedded.org/revision/info/9f227060931d6ef3c46ac867c9d5ab6f7ff4c7b8
>  Files:
>  1
>  conf/distro/include/angstrom-2008-preferred-versions.inc
>  conf/distro/angstrom-2008.1.conf
>  Diffs:
>
>  #
>  # mt diff -r9d7c2a8ce1e28ac215be4fd94fbde27112c167bb -r9f227060931d6ef3c46ac867c9d5ab6f7ff4c7b8
>  #
>  #
>  #
>  # add_file "conf/distro/include/angstrom-2008-preferred-versions.inc"
>  #  content [ebf743b8e6427e99a80a69e6d3b9c91f88e89d8d]
>  #
>  # patch "conf/distro/angstrom-2008.1.conf"
>  #  from [7ea86daa05508d4bd45a3e6eeba28b45153de9fe]
>  #    to [68d8c62fce1fc4da0724773e540d24dd355ccaeb]
>  #
>  ============================================================
>  --- conf/distro/include/angstrom-2008-preferred-versions.inc    ebf743b8e6427e99a80a69e6d3b9c91f88e89d8d
>  +++ conf/distro/include/angstrom-2008-preferred-versions.inc    ebf743b8e6427e99a80a69e6d3b9c91f88e89d8d
>  @@ -0,0 +1,8 @@
>  +PREFERRED_VERSION_dbus = "1.1.4"
>  +PREFERRED_VERSION_busybox = "1.9.1"
>  +PREFERRED_VERSION_gst-pulse = "0.9.7"
>  +PREFERRED_VERSION_libtool = "1.2.14"
>  +PREFERRED_VERSION_pulseaudio = "0.9.9"
>  +PREFERRED_VERSION_udev = "118"
>  +PREFERRED_VERSION_vte = "0.16.10"
>  +
>  ============================================================
>  --- conf/distro/angstrom-2008.1.conf    7ea86daa05508d4bd45a3e6eeba28b45153de9fe
>  +++ conf/distro/angstrom-2008.1.conf    68d8c62fce1fc4da0724773e540d24dd355ccaeb
>  @@ -22,6 +22,7 @@ require conf/distro/include/sane-srcrevs
>
>   require conf/distro/include/sane-srcdates.inc
>   require conf/distro/include/sane-srcrevs.inc
>  +require conf/distro/include/angstrom-2008-preferred-versions.inc
>
>   #Images built can have to modes:
>   # 'debug': empty rootpassword, strace included
>  @@ -71,16 +72,10 @@ PREFERRED_VERSION_uclibc-initial ?= "0.9
>
>
>   #Prefer a newer GTK+ and friends
>  -PREFERRED_VERSION_gtk+                 = "2.12.3"
>  -PREFERRED_VERSION_glib-2.0              = "2.14.4"
>  -PREFERRED_VERSION_pango                 = "1.18.1"
>  +PREFERRED_VERSION_gtk+                 ?= "2.12.3"
>  +PREFERRED_VERSION_glib-2.0              ?= "2.14.4"
>  +PREFERRED_VERSION_pango                 ?= "1.18.1"

Why the change to ?= and why are those not in -preferred-versions.inc?

regards
Philipp


