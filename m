Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P8eFQ-0005tm-3q
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 21:22:53 +0200
Received: by yxt3 with SMTP id 3so1976076yxt.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 12:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=ppauSL/kNxNRzO7eG8UDbnFmRSMIj3PoAoM/Oal+fAA=;
	b=joDeWB4btr69LQd1+tl5NFpLdzZS0SKDdRtLTrq6pq5nq6G38gB03VrnRJhmcrKKXz
	HDZWy+TvdesFqN1qOVYbO6pI9GZpb4nej4QvHgblN9XG6UKLqy/Eq4jqDBu2D78Yci2d
	rSpQ6mGmPeXdfVsy7MWFUEe36spWTWo+qF3Pk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=bMumAaNWH7PvfLle55upS3lku/k8W5MKcb6DsN63hEmx7i2aeYycsejvPIiUpeJG5k
	h6sJjuxkdA0CtXfx6EznT9ibFl2/wdJ+sxrdXu1NvZJXmkYlZDyoYXviF/33dMR89HUK
	gzr2fjYkDKHadlffAE1x2N2ISdGspU9OYvhhw=
Received: by 10.90.119.4 with SMTP id r4mr669809agc.66.1287602533677; Wed, 20
	Oct 2010 12:22:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.6 with HTTP; Wed, 20 Oct 2010 12:21:53 -0700 (PDT)
In-Reply-To: <4CBF357C.10600@opendreambox.org>
References: <4CBEB7E8.5020109@nedap.com>
	<AANLkTikBiKGuQYXCdi_QMirA7_AjQn9b0A0CWtmkMu90@mail.gmail.com>
	<29F88E4E-18CC-4CD2-8A76-5C78ED4EDAC7@nikom.net>
	<20101020140543.GN3324@jama>
	<4CBF01C6.7030409@gravedo.de> <i9n56p$ppm$1@dough.gmane.org>
	<AANLkTikF4A8F5n8nNdr=5ttSox5qgfTwobz-pNTEL+Li@mail.gmail.com>
	<4CBF357C.10600@opendreambox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Oct 2010 12:21:53 -0700
Message-ID: <AANLkTi=ofPMThC6nuWJx3MDHJ_Vfn2+hDgsCPX71B8BW@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: failure building gcc-cross-initial for armv5te
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
X-List-Received-Date: Wed, 20 Oct 2010 19:22:53 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 20, 2010 at 11:31 AM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> On 10/20/2010 07:18 PM, Khem Raj wrote:
>> The problem should be fixed now
>
> I think the same fix should be applied to gcc-configure-target.inc.
>

not necessary. because gcc-configure-target.inc is only included in
target recipes unlike binutils but would not be harmful if applied.

> Regards,
> Andreas
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


