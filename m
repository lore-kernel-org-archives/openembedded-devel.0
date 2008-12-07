Received: from [209.85.198.245] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1L9Qhq-0002Ah-9W
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Dec 2008 21:58:22 +0100
Received: by rv-out-0708.google.com with SMTP id f25so920933rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Dec 2008 12:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=9iOvVAdPc9WwwP3sqg7oyWs1vQrIeY8HytqaI5htAG4=;
	b=GNFkWwaK7DxSBt+5EeBTmspw6IA9Ov7CPeVwyojA0z1q4jAE3iFKO5cDAKVItsEvZo
	WcjKVeCT24TXm/918eVzpDERy+wo3oNeN1yuOT8fJAEzwzel/cjQAXZq5Jum4tngukup
	YbHxBtVip64Fo3aYpwuvZgOO6Ou64OYqL/Gb8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=OmaUQgLd4bEwzB6aAVetc4VGclxxlzEtX56mHV3FUoxLiz2sfvzpfp0tvkKF36ydvu
	WYu9h/1fGku2G6tQXMzZtd2YpaZE9/uie6AmSUuIa2Gr5APe3o4Qnt722kF7+1kg9zfW
	wMFam0946pFLBARRtLMtYqBGMQ+IlcvR+9qDI=
Received: by 10.142.207.8 with SMTP id e8mr1128751wfg.30.1228683272888;
	Sun, 07 Dec 2008 12:54:32 -0800 (PST)
Received: from localhost (adsl-71-146-4-209.dsl.pltn13.sbcglobal.net
	[71.146.4.209])
	by mx.google.com with ESMTPS id 32sm873432wfc.39.2008.12.07.12.54.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 07 Dec 2008 12:54:32 -0800 (PST)
Date: Sun, 7 Dec 2008 12:54:30 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081207205430.GA4642@gmail.com>
References: <20081207001050.GA1796@gmail.com>
	<20081207005017.GK16628@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20081207005017.GK16628@smtp.west.cox.net>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Cc: openembedded-devel@openembedded.org
Subject: Re: mips site files update
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
X-List-Received-Date: Sun, 07 Dec 2008 20:58:23 -0000
X-Groupsio-MsgNum: 6907
Content-Type: multipart/mixed; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline

--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (06/12/08 17:50), Tom Rini wrote:
> On Sat, Dec 06, 2008 at 04:10:50PM -0800, Khem Raj wrote:
> 
> > Hi 
> > 
> > Trying to build for mips based machines. I needed this patch to get the
> > console-image building. 
> > 
> > OK for .dev
> 
> Can we please please please start splitting things up into common-linux
> and common-glibc/uclibc instead?  That way we fix more than mips.

Good. I figured that I only needed this change to get it going.

Thanks
-Khem

--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=patch

diff --git a/site/common-linux b/site/common-linux
index 8d915d0..17d7a8d 100644
--- a/site/common-linux
+++ b/site/common-linux
@@ -10,3 +10,7 @@ samba_cv_HAVE_IRIX_SPECIFIC_CAPABILITIES=${samba_cv_HAVE_IRIX_SPECIFIC_CAPABILIT
 # coreutils
 fu_cv_sys_stat_statfs2_bsize=${fu_cv_sys_stat_statfs2_bsize=yes}
 
+# popt
+ac_cv_va_copy=${ac_cv_va_copy=yes}
+ac_cv___va_copy=${ac_cv___va_copy=yes}
+

--3MwIy2ne0vdjdPXF--
