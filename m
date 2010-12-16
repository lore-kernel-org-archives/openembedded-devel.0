Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PT7S2-0001bC-32
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Dec 2010 07:36:30 +0100
Received: by iwn8 with SMTP id 8so3125906iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 22:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=6VBouZm1aadhcOj12DZdFzXhn5VHb6o1cyFTzLdJSLM=;
	b=GHW/gkhbpTVDIKWUtwTzY6FlOggDJ+uQhDz33scOeQBsWNcT0CDVEPnrGRXEc5vRt3
	Rbb16wZ6rR1qutl3d1T6/ekjLJXwBsb1W7l/3wjrYymK9TzhjRyqXT8wyh81ANYoA7lz
	CUoNH46bR0QM45ZSsxWhklnkmp3XEHdQhinOc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=rRwMlDBbtf4eSBs3ZHf/PYQf0tbO5DaBSo0/UgCeCGHOLSn5uA2gFeRPbvmSM2piXX
	As85CiXvMNSVFExMSN/QsxFtGcopmduGlN4e46Z30AxkYfMPQLCJOBsEER09T9kOabE0
	s7NWnWY0QgPwFGZwauvLkDIrOT4Fw5rthxaJY=
Received: by 10.42.173.71 with SMTP id q7mr6901786icz.65.1292481292519;
	Wed, 15 Dec 2010 22:34:52 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id z4sm1640343ibg.1.2010.12.15.22.34.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 15 Dec 2010 22:34:51 -0800 (PST)
Date: Wed, 15 Dec 2010 22:34:56 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101216063456.GG18068@gmail.com>
References: <E1PR45K-0000jK-SU@melo.openembedded.org>
	<01EE9A12-BE87-4EF6-9F0B-EAA20A1DBAAE@vanille-media.de>
	<4D077186.2050708@balister.org> <20101214133729.GE6662@jama>
	<ie9tg4$9t0$1@dough.gmane.org> <20101215082910.GA3238@jama>
	<4D08B85B.3000404@balister.org> <4D08BF5E.5050105@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <4D08BF5E.5050105@opendreambox.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Philip Balister : i2c-tools : Stage i2c-dev.h header as i2c-dev-user.h.
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
X-List-Received-Date: Thu, 16 Dec 2010 06:36:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (15/12/10 14:15), Andreas Oberritter wrote:
> On 12/15/2010 01:45 PM, Philip Balister wrote:
> > On 12/15/2010 03:29 AM, Martin Jansa wrote:
> >> On Wed, Dec 15, 2010 at 09:16:04AM +0100, Koen Kooi wrote:
> >>> What are other distributions based on? Pixie dust?
> >>
> >> I meant distritubions where end-user normally gets only recipes how to
> >> build from source
> >> on his machine instead of installing prebuilt binary packages shipped
> >> by distribution.
> >>
> > I am not sure there is a lot od software that uses the problematic
> > header :)
> > 
> > Khem suggested we put the file in include/i2c-tools/i2c-dev.h. This
> > means programs that need the i2c-tools version can adjust the header
> > search path with a -I.
> 
> I think what Khem suggested was ${include}/i2c-tools/linux/i2c-dev.h,
> because otherwise programs including <linux/i2c-dev.h> would still pick
> up the kernel header, even if -I${include}/i2c-tools was prepended to
> the program's CPPFLAGS.

Yes. that would be ok too. However I think it will be better to
differentiate here in source code. and I would expecte the inclusion
of linux/i2c-dev.h to change to i2c-tools/i2c-dev.h that would make
it more clear that a given package does not use linux provided header

> 
> Regards,
> Andreas
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


