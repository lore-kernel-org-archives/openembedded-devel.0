Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QJSEX-000793-5t
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 17:18:53 +0200
Received: by qwh5 with SMTP id 5so3352288qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2011 08:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=FntVJiWd1zA8tzYiqmvGT0DIYogfMSRaxZ1tSwgdMFo=;
	b=n/oTjeLvE8eoGoo+zJJniB5WHIHAjRPEY9Cb/OHT6dcawy2CS4jhbHts5fE0KsBOaq
	F4TdCEsib01SnOGXSzFlhHTn7ZXfv52Ff8sd+c1Cuy1HQAiC3pNsRwjjjD/HwTG5aXHj
	UII1C7lGBHqGjo/QGQzWFY5IOpLCCmQTLVGf0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=SBoxsZpY8zzOCxZ/6h1D30DHFI4h9gMaKn1ZoosmD7PH3qorukV0/DMus5WSC0MRdz
	02ZrDXGKZv8zdzBh6R0nHYvBphQ4/WbZs3bfqCOWuax/blVG+9n4OOHKMFx0we1OJjqW
	xP3gEAUWxEB18tJrgVmjtsMuYx0R2Aq7MHQgc=
Received: by 10.52.110.70 with SMTP id hy6mr5377588vdb.21.1304954168066; Mon,
	09 May 2011 08:16:08 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.114.233 with HTTP; Mon, 9 May 2011 08:15:48 -0700 (PDT)
In-Reply-To: <1304953516.8000.105.camel@phil-desktop>
References: <1304952485-8207-1-git-send-email-raj.khem@gmail.com>
	<1304953516.8000.105.camel@phil-desktop>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 9 May 2011 08:15:48 -0700
X-Google-Sender-Auth: kXj-oN-iDKBUDi2WE8QkL043PSQ
Message-ID: <BANLkTi=aS9eCsdoaQPUgyrwWqku0-2DsaA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCHv3 1/3] conf/layer.conf: Use .= for BBPATH and += for BBFILES
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
X-List-Received-Date: Mon, 09 May 2011 15:18:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 9, 2011 at 8:05 AM, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2011-05-09 at 07:48 -0700, raj.khem@gmail.com wrote:
>> From: Khem Raj <raj.khem@gmail.com>
>>
>> Provide additional commentary that should help a bit more
>
> I'm still struggling slightly to understand why this patch is an
> improvement. =C2=A0As far as I can tell:
>
> - the change from prepending to appending BBPATH will alter all the
> priorities of the layers. =C2=A0It isn't entirely obvious to me if (or wh=
y)
> this is a good thing; and
>
> - the change to the way that BBFILES is assigned doesn't make any
> functional difference. =C2=A0Is that just a cosmetic change?
>
> Also:
>
>> +# It really depends on order of the layers appearing in BBLAYERS
>> +# variable in toplevel bblayers.conf file, where bitbake will search
>> +# for .inc files and others where bitbake uses BBPATH since it will
>> +# search the directories from first to last as specified in BBPATH
>> +# Therefore if you want a given layer to be considered high priority
>> +# for the .inc and .conf etc. then consider it adding at the beginning
>> +# of BBPATH. For bblayers bitbake will use BBFILES_PRIORITY to resolve
>> +# the recipe contention so the order of directories in BBFILES does
>> +# not matter.
>
> Maybe it's just my lack of familiarity with the code, but I find this
> comment rather difficult to parse. =C2=A0Even after reading it a few time=
s
> I'm not totally sure that I've grasped what the first sentence is
> saying.

The layer.conf files are parsed in the order of the layers in
BBLAYERS, and the resulting BBPATH will be based upon that and whether
the layer.conf files appended or prepended to it.  Recipe priority,
however, is governed by the BBFILE_ variables in the layer. So
responsibility over the priority of a given layer is split, in two
different places, the layer itself, and the user/project
configuration.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


