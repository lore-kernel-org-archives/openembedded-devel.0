Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PInBL-0006Xl-5P
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 19:56:37 +0100
Received: by gyf3 with SMTP id 3so1379577gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 10:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=PQU/gVfzrUYpcEaaDUjwqK9XrWJWP8OMuBmI3/aUC1o=;
	b=wUZIaDXhHHiXzsaGE7+T3EyUCycG8BDDVVM7eSTaA9iL/cPCCteVmMn0ZuQ10vn7Lh
	85GvMKqSX9hz3HRq43UDVrchoyBOr6z7g1YkU7tTLqDMjf/5bRTY81IdeaSiYyXsnRax
	KsoHZXtg2O/JUiutzSFYQuAOKRjK22b8ojZns=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=lmDAvAV64nlBynP3iCS23YFnS+DAiP2bBZ2K7bzCySP+P/CsQ6XIQA/+DMrm8hdiBM
	PcWn7RRq5LolENAp6mnVBMMJQL000dIyYTEpCVxnj2gpUQlJ5ncZDArT2p7QEe1dGdV2
	VxaCUuLJ0VLTU1fET8N0IJitRJDVZ/KucFK4k=
Received: by 10.91.121.3 with SMTP id y3mr5869437agm.156.1290020120517; Wed,
	17 Nov 2010 10:55:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Wed, 17 Nov 2010 10:54:58 -0800 (PST)
In-Reply-To: <AANLkTi=B4o0F6LAcfhG7gz8EKBCT14-V7rjUDY8-Yp_o@mail.gmail.com>
References: <1289064270-20041-1-git-send-email-moncelier@devlife.org>
	<1289064270-20041-2-git-send-email-moncelier@devlife.org>
	<AANLkTiksrxSauzYBx+EupT+vkLyt_C0VgUDeXb8PxtF8@mail.gmail.com>
	<AANLkTi=B4o0F6LAcfhG7gz8EKBCT14-V7rjUDY8-Yp_o@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Nov 2010 10:54:58 -0800
Message-ID: <AANLkTinGrMTiKUjwZ3aBr5z5nera5RGFxR2jMhpgW47P@mail.gmail.com>
To: Camille Moncelier <moncelier@devlife.org>
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 02/11] dropbear: Removed openmoko references. Added /etc/default/dropbear
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
X-List-Received-Date: Wed, 17 Nov 2010 18:56:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 17, 2010 at 12:38 AM, Camille Moncelier
<moncelier@devlife.org> wrote:
> On Wed, Nov 17, 2010 at 12:40 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> > diff --git a/recipes/dropbear/dropbear/default
>> > b/recipes/dropbear/dropbear/default
>> > new file mode 100644
>> > index 0000000..a4f2bfd
>> > --- /dev/null
>> > +++ b/recipes/dropbear/dropbear/default
>> > @@ -0,0 +1,4 @@
>> > +# DROPBEAR_BANNER=3D""
>> > +# DROPBEAR_RSAKEY=3D"/etc/dropbear/dropbear_rsa_host_key"
>> > +# DROPBEAR_DSSKEY=3D"/etc/dropbear/dropbear_dss_host_key"
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^
>> should this be dsa ?
>
>
> Nope, it's DSS . You can look in=C2=A0recipes/dropbear/dropbear/init,
> dropbearkey use dss for its key type.

interesting. It almost looks like a typo

> --
> Camille Moncelier
> http://devlife.org/
>
> If Java had true garbage collection, most programs would
> delete themselves upon execution.


