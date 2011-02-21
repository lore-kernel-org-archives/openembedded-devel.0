Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PrbLQ-0006g8-S7
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Feb 2011 20:22:53 +0100
Received: by pxi17 with SMTP id 17so154198pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Feb 2011 11:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=tCQHw3LeNUcK/68TXeqyoxWhUfgVSggclWuzaWML/Ak=;
	b=Mrn3Z8e2G0MeSVRXtTg/OFQLO0cPSo7R10wUuPhe49ugm8sJADi5rgsCWBl8ME/ZmM
	V3sNT1dYpwj3i5An/lFunN8Jd2FkdjIoQ1J+N+k7DthOlLvVDLYpSHfMAy2q4Kpb+t7V
	qJwIsxEXfENnUY7+YCv2QINRLG9JO4Fixn4Ro=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=rlQkIdck4UW7ZTQUcpJNR2tZvC4oesjlUC4kC92fHyWKo6DY1vf74gisMQ8CmJ8EEb
	iwhy93LcqHMfEN8uRPlZMQG/4u+kLPwHN3+CQ3ngdh0S0x+LsOU6yVZBEQA3IbI5mNG1
	1D14WvgLM10sBCOuLXUSY/P7FCfi+G+4OJcvU=
Received: by 10.142.14.15 with SMTP id 15mr1445686wfn.141.1298316092981;
	Mon, 21 Feb 2011 11:21:32 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w19sm4075095wfd.8.2011.02.21.11.21.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Feb 2011 11:21:31 -0800 (PST)
Date: Mon, 21 Feb 2011 11:21:39 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110221192139.GC10070@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <4D61CA73.7000306@mwester.net>
	<AANLkTimUMs9CBky1JmzY7BUMQTdHfUsyRqdMa7JvgufX@mail.gmail.com>
	<4D627669.5010605@mwester.net>
MIME-Version: 1.0
In-Reply-To: <4D627669.5010605@mwester.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] squid: fix references to host headers and libs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Feb 2011 19:22:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (21/02/11 08:27), Mike Westerhof wrote:
> On 2/21/2011 2:34 AM, Khem Raj wrote:
> > On Sun, Feb 20, 2011 at 6:14 PM, Mike Westerhof <mike@mwester.net> wrote:
> >> This patch changes hard-coded references to /usr and /opt in the various
> >> squid config.test scripts to point to the correct sysroot paths.
> >>
> >> Signed-off-by: Mike Westerhof <mike@mwester.net>
> >> ---
> >> diff --git a/recipes/squid/squid_3.1.9.bb b/recipes/squid/squid_3.1.9.bb
> >> index 713b1ea..ecd6fdc 100644
> >> --- a/recipes/squid/squid_3.1.9.bb
> >> +++ b/recipes/squid/squid_3.1.9.bb
> >> @@ -1,4 +1,4 @@
> >> -PR = "${INC_PR}.0"
> >> +PR = "${INC_PR}.1"
> >>
> >>  include squid.inc
> >>
> >> @@ -18,6 +18,11 @@ do_configure_prepend() {
> >>        export ac_cv_epoll_ctl=yes
> >>        export ac_cv_epoll_works=yes
> >>        export ac_cv_func_setresuid=yes
> >> +       # Patch up the various config scripts to refer to sysroot
> >> +       for i in `find ${S} -name config.test`; do
> >> +           sed -i -e 's|/usr|${STAGING_DIR_HOST}/usr|g' \
> > 
> > I dont know if this works for say micro distro. May be using
> >  STAGING_EXECPREFIXDIR instead of ${STAGING_DIR_HOST}/usr
> > 
> > or using
> > 
> >  ${STAGING_DIR_HOST}${exec_prefix}
> > 
> > would be more portable
> 
> Does micro actually change the structure of the *staging*
> directories, then?
> 
> What I'm trying to do here is perhaps best expressed by example.
> Here's a few lines from one of those config.test files:
> 
> if [ -f /usr/include/db.h ] && grep dbopen /usr/include/db.h; then
>     exit 0
> fi
> exit 1
> 
> I'm simply prefixing those paths with the correct path to the
> sysroot, so it becomes:

hmmm that wont work then. This would need patching the sourcecode to use
$includedir instead of /usr/include


> 
> if [ -f /r/slug/tmp/sysroots/armv5te-oe-linux-gnueabi/usr/include/db.h ] && grep dbopen /r/slug/tmp/sysroots/armv5te-oe-linux-gnueabi/usr/include/db.h; then
>     exit 0
> fi
> exit 1
> 
> Would these paths be different for micro, then?
> 
> -Mike (mwester)
> 
> > 
> >> +                  -e 's|/opt|${STAGING_DIR_HOST}/opt|g' "$i"
> >> +       done
> >>  }
> >>
> >>  do_install_append() {
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >>
> > 
> > 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


