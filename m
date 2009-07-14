Received: from [74.125.92.145] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1MQpWA-0001Oz-2g
	for openembedded-devel@openembedded.org; Tue, 14 Jul 2009 23:26:30 +0200
Received: by qw-out-1920.google.com with SMTP id 5so1100754qwc.6
	for <openembedded-devel@openembedded.org>;
	Tue, 14 Jul 2009 14:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=x6jww+q83D3vrMeI3bbmb9bT8dwwGt6/UFkGYbXxYXQ=;
	b=nvITU5eWZGf192h9pysWasU0rC4Mpm13SX3GxEO8mti2TBKCFPgFTW2OcPJClIM+3e
	SxAnHTC6DfV2MyQR79xOLJmylT8iAS+VljRmVoGmfedoLbZIt9Zj0l6ULvMm/Lrj77ni
	f2rHl/piuiVLMHQZlyknjY+Sc9zbF/WCaW98o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=unrJDvDPvifu93FViBLcivUdw7L6eFpq82PdZq2y0crxVG7co0ifzDb+YMwroD9m99
	3rJnZTA5O8MIfHW0SibnkHjbNcoPHxVIX5wAOyG+BiDBdB8pOc6qJN+oFKK+i1tnUltK
	wVn1guulNxdovAOpVzfo0XeYow8+LirIrFcy4=
MIME-Version: 1.0
Received: by 10.231.37.73 with SMTP id w9mr1742396ibd.2.1247605989827; Tue, 14 
	Jul 2009 14:13:09 -0700 (PDT)
In-Reply-To: <h3iq36$riq$1@ger.gmane.org>
References: <200907121334.38852.raj.khem@gmail.com>
	<20090713035713.GA21203@denix.org>
	<1247600832.29960.18.camel@dax.rpnet.com> <h3iq36$riq$1@ger.gmane.org>
Date: Tue, 14 Jul 2009 23:13:09 +0200
Message-ID: <c384c5ea0907141413p49b39706t95e7b426d0d276a8@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: e2fsprogs-libs build failure analysis
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
X-List-Received-Date: Tue, 14 Jul 2009 21:26:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Tue, Jul 14, 2009 at 10:33 PM, Koen Kooi<k.kooi@student.utwente.nl> wrote:
> On 14-07-09 21:47, Richard Purdie wrote:
>
>> The real problem here is two packages providing the same library. This
>> is actually a critical error and means your distro is screwed unless
>> handled very carefully. Rather than hacking around the problem, I'd much
>> rather we detect and abort in this case and warn the user something is
>> about to break and that any package feeds will need careful attention.
>
> In this case it works as intended, at least in angstrom :)
>
Not sure, I get build errors on both packages.

http://bugs.openembedded.org/show_bug.cgi?id=5149

Regards,
-- 
Leon


