Received: from [209.85.221.197] (helo=mail-qy0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MWDca-0002Ii-Dn
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Jul 2009 20:11:24 +0200
Received: by qyk35 with SMTP id 35so1285612qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2009 10:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=58HIq5Xj0IK0XIV8eJsOvnW098PKHQAxfvDQsmPH1dk=;
	b=EeQRVPBQdMeZyXMF7RRCYFIbbUswS1OVOgRMr86kY4A1j08PqyyNp1Nat/zxduZBgN
	/ISsJ22tn5uHl/SeGX+bTYmLA+19w/rjAJiRIB8aogeIyu1GypBVrunA3q6ZgmyK8UKb
	wtl3U/xqGtLo3Psn5bUkt/Ju+auG2ceIJWnSI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=eBfxThmEVnJzvzEeqwg6n+sbyhPBevChvsuc6YaTsNkaPAi7PvtP3YmnHHyTPsMynk
	atxTdOFnD1drD158VBbkzlB/N5FIFoKCcvIbC64dMDTVvFWHqp/w/TxOQ5aRp+WUq5mY
	GVCC2swCF2gPldjsOmNGG7FbxUvbQbF6hZVCg=
MIME-Version: 1.0
Received: by 10.220.93.67 with SMTP id u3mr162520vcm.27.1248890187114; Wed, 29 
	Jul 2009 10:56:27 -0700 (PDT)
In-Reply-To: <1248852543.4187.40.camel@lenovo.internal.reciva.com>
References: <20090728072202.GA5422@gmail.com>
	<200907290614.40124.holger+oe@freyther.de>
	<19c1b8a90907290002i1a80a99fqfbb42128472f3299@mail.gmail.com>
	<1248852543.4187.40.camel@lenovo.internal.reciva.com>
Date: Wed, 29 Jul 2009 10:56:27 -0700
Message-ID: <19c1b8a90907291056p576a428eu7a38846c2bf88f0@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] Adding TLS selection choice to metadata
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
X-List-Received-Date: Wed, 29 Jul 2009 18:11:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Wed, Jul 29, 2009 at 12:29 AM, Phil Blundell<pb@reciva.com> wrote:
> On Wed, 2009-07-29 at 00:02 -0700, Khem Raj wrote:
>> I did however nptl/uclibc builds we need TLS support to be enabled
>> and there is no way to differentiate the triplets for a NPTL uclibc
>> toolchain from non NPTL toolchain. In future not all arches will get
>> NPTL support
>> on uclibc at once so we wil have few arches where NPTL will be there and
>> that will require TLS whereas others will use Linux Threads and will
>> have to disable TLS.
>
> Is it so hard to add the missing tls bits to uclibc's linuxthreads?
> That sounds like the best way to solve that problem.
>

there were discussions around that but not enough interest


> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


