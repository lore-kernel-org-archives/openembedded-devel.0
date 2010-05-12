Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OCG72-00031l-Nb
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 19:53:10 +0200
Received: by wyb34 with SMTP id 34so243473wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 May 2010 10:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=tGI9oiJfEMpKC2p1dRqvHYMKaqog+rpsjFDCd00ywgA=;
	b=SftFZ8OzgUBpWJISddc6cSw+PDKEtAw1y3N3PLb/F6uCrGLZRBBkJFS5qYkqQ7YUkE
	OHxIS1ygCTTuHXbDUI9KwpdC1VCDZUHhj2FCzwdYHrzN4R5kjfTW9yTM23uHX8SfFP6l
	brhAfpOBsrA8kUTgT7qmrCLhCBITROqqo83kU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=ww5EQlxgcvDA+vTEI16WayccP8PseJhKI+uknfm9HcRnAJlj6M3xrp3xKsS+w1iKrr
	DqKKO0bXng2X7yXnbtGoNfSsUfnMi2cSU7CLYbWtdINcIuYQZoPBWugpQop40MCmb+zH
	DuUdn66VoN531cJ9x++b9GA/fN8X7Ck1av6WU=
Received: by 10.227.127.197 with SMTP id h5mr7227821wbs.15.1273686537679;
	Wed, 12 May 2010 10:48:57 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id p10sm1143793gvf.22.2010.05.12.10.48.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 12 May 2010 10:48:52 -0700 (PDT)
Date: Wed, 12 May 2010 10:49:02 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100512174902.GA9872@gmail.com>
References: <20100510232720.GA13708@gmail.com>
	<201005111239.57770.khimov@altell.ru>
	<AANLkTinrTuitVH__A-t7tjdit9HLCf7AYFyl1w4vFLIo@mail.gmail.com>
	<1273657450.1773.43.camel@saphir>
MIME-Version: 1.0
In-Reply-To: <1273657450.1773.43.camel@saphir>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Move sane-toolchain defaults for gcc binutils and eglibc
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
X-List-Received-Date: Wed, 12 May 2010 17:53:32 -0000
X-Groupsio-MsgNum: 19200
Content-Type: multipart/mixed; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (12/05/10 11:44), Michael 'Mickey' Lauer wrote:
> Am Mittwoch, den 12.05.2010, 11:39 +0200 schrieb Martin Jansa:
> > On Tue, May 11, 2010 at 10:39 AM, Roman I Khimov <khimov@altell.ru> wrote:
> > > В сообщении от Вторник 11 мая 2010 03:27:20 автор Khem Raj написал:
> > >> 4.4.3 is not so widely used in distributions unlike 4.4.2
> > 
> > Hi,
> > 
> > My guess: just because it's not preferred by sane-toolchain.inc?
> > 
> > >> I can also just add 4.4.4 and leave 4.4.3 as it is if someone wants
> > >> to keep using 4.4.3
> > >
> > > Using 4.4.3 here, think it'd be nice to move to 4.4.4.
> > 
> > what about updating
> > conf/distro/include/sane-toolchain.inc
> > to 4.4.4 if we don't find any new issue with it?
> 
> Sounds good.

Here is a patch to move gcc to 4.4.4, eglibc to 2.11 and binutils to
2.20.1 releases as defaults. I have tested this combination on ARM
and x86 without any regressions that I dont have on existing combination. 

sane-toolchain.in is used by kaeilos-2010, shr, micro and minimal DISTROs
if the maintainers are ok with this then please ack this patch

Thanks
-Khem

Signed-off-by: Khem Raj <raj.khem@gmail.com>

--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=diff

diff --git a/conf/distro/include/sane-toolchain.inc b/conf/distro/include/sane-toolchain.inc
index daa2def..7f249b0 100644
--- a/conf/distro/include/sane-toolchain.inc
+++ b/conf/distro/include/sane-toolchain.inc
@@ -5,14 +5,14 @@
 #############################################################################
 
 # Base line versions, good for most things
-PREFERRED_GCC_VERSION                ?= "4.4.2"
-PREFERRED_BINUTILS                   ?= "2.20"
+PREFERRED_GCC_VERSION                ?= "4.4.4"
+PREFERRED_BINUTILS                   ?= "2.20.1"
 
 # Prefer glibc 2.6 and uclibc 0.9.30, these have had the most testing.
 PREFERRED_VERSION_glibc             ?= "2.10.1"
 PREFERRED_VERSION_glibc-initial     ?= "2.10.1"
-PREFERRED_VERSION_eglibc             ?= "2.10"
-PREFERRED_VERSION_eglibc-initial     ?= "2.10"
+PREFERRED_VERSION_eglibc             ?= "2.11"
+PREFERRED_VERSION_eglibc-initial     ?= "2.11"
 PREFERRED_VERSION_uclibc            ?= "0.9.30.1"
 PREFERRED_VERSION_uclibc-initial    ?= "0.9.30.1"
 

--2oS5YaxWCcQjTEyO--
