Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q25KL-0000W4-Gm
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 18:25:06 +0100
Received: by iyb26 with SMTP id 26so7943938iyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 10:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=TKwaZ0UPggnfCON2rQR/cdNQB2hDsfvZz44dSmvBxWI=;
	b=TRlwTOqcgV3blXA79sotxuHpbMEn4yr6k0dKMMgtCj5M5iVoxpqYohUOod2tNytdLK
	xuotczRoBr3gm/QR7VOlRfbb+dmgIDzneVMU/Gl941A8u3NrOdnAzaQ5H7fw2Y7dKVf5
	JOlanUcmz2i7ynDk3lUJkK6h6hU9k1MxDEcIw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	b=jfMgCKW5g7OVe6hezufcETSnWa4ecyHukQjsrDaScmTdVs1mMzCWU/LqEFXenm9LbK
	I95RuarfiKtvRvWxQsCk4rgADCYw2jskvQIKIjJaYIh1VHDsLitcK9cqigYAfjYVhJL9
	5Xa8mFv8Tuqvxn6Ww142t8cY6LM6Zr/LN88NY=
Received: by 10.43.48.131 with SMTP id uw3mr3673107icb.405.1300814558216;
	Tue, 22 Mar 2011 10:22:38 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id i20sm4524314iby.65.2011.03.22.10.22.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Mar 2011 10:22:36 -0700 (PDT)
Date: Tue, 22 Mar 2011 10:22:51 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110322172251.GB22283@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1300784531-13757-1-git-send-email-heinold@inf.fu-berlin.de>
	<AANLkTi=Q6ATHuoUN87y8G9futYc+2iJ9c23YLRfPYOZj@mail.gmail.com>
	<AANLkTim2xJnB2x3gDkA4vfmghv6UeamRcUPYXhSxjxjf@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTim2xJnB2x3gDkA4vfmghv6UeamRcUPYXhSxjxjf@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: lzma has no -e option
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
X-List-Received-Date: Tue, 22 Mar 2011 17:25:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (22/03/11 09:32), Otavio Salvador wrote:
> On Tue, Mar 22, 2011 at 06:22, Andrea Adami <andrea.adami@gmail.com> wrote:
> > Yes, I've seen this too.
> > It's due to a mismatch between lzma (utils) and xz (utils).
> >
> > We should probably move to xz   http://tukaani.org/xz/
> 
> I see no point in having lzma images but we can use xz utils to
> generate lzma if desired. I'd say to us to drop lzma-native and use xz
> to build those or drop them.

Seems ok. Can you cook up a patch ?
> 
> -- 
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


