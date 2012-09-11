Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gizero@gmail.com>) id 1TBR1J-0004z4-Bs
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Sep 2012 16:00:53 +0200
Received: by weyr6 with SMTP id r6so299787wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2012 06:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=LxPit98oXy615QmZnSPt1znILmaWCLzTxAVYx3gtg7A=;
	b=Ks9tIMZjYPIYbWkrdXKcuOPBp891N0qMOukyuOnNphpEbV2Xq7EveEyuBFJXf8orKo
	2aDr1gs1A1JzmHmu/CwzYatEmdgMIvnXg5BU+i6AcY2LsPNLuGB7PaPkR+WMPQPAFE38
	QgguYvyCaXVGzo371O1rExYIDVQR6dIssltIKlAFMYH4KB8rjNegK4DxNtckICw1hlOG
	Z5kU5lTTYdXICwR8x680c4hN2acgccBWjhdboSFJ9+jShmYsLmvkviiE7uu3IDFAZ0wW
	nUwCpr7hdO2dM1EQrh0qvXhfTDD5IgTDaxZuli/olbr1ZVRTZ1K1n8M6fPlk8g443U3k
	2KtQ==
MIME-Version: 1.0
Received: by 10.180.91.1 with SMTP id ca1mr25367887wib.8.1347371302578; Tue,
	11 Sep 2012 06:48:22 -0700 (PDT)
Received: by 10.223.156.5 with HTTP; Tue, 11 Sep 2012 06:48:22 -0700 (PDT)
In-Reply-To: <504EFEE1.3040000@baumann.name>
References: <504E1F94.9000606@baumann.name>
	<20120911044922.GD2980@sakrah.homelinux.org>
	<504EFEE1.3040000@baumann.name>
Date: Tue, 11 Sep 2012 15:48:22 +0200
Message-ID: <CAC+thW1XEngvZiUssM2s4L93ebc1pxy1ibA5zuZmDQL-3aoHTQ@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: minimal template layer for new machine support
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
X-List-Received-Date: Tue, 11 Sep 2012 14:00:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Tilman,

On Tue, Sep 11, 2012 at 11:05 AM, Tilman Baumann <tilman@baumann.name> wrote:
> On 11/09/12 05:49, Khem Raj wrote:
>>
>> On (10/09/12 18:12), Tilman Baumann wrote:
>>>
>>> Hi,
>>>
>>> I'm working on a TI DM812x support overlay.
>>> I guess what it comes down to is a new kernel recipe (based on TI's
>>> sources) and this funny two stage u-boot.
>>> I think I can write the recipes. But what I don't quite see is how I
>>> would add a new supported machine in the first place?
>>> I was trying to orient myself on a few existing machine support
>>> layers. But I think I'm still missing the point.
>>> What are the minimal basics to implement? Where should I start?
>>
>> check meta-ti
>> http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/
>>
>> may be there is a BSP already or something similar you can start off.
>>
>>
> Oh, great. I think I can work with that.
> I only knew the Arago project, but that is not based on oe-core.

As far as I know, there also exists an effort by the meta-ti people to
port the original Arago distro to the new layered architecture over
oe-core: this is called meta-arago
(http://arago-project.org/git/?p=meta-arago.git;a=summary).
You'd better ask on the meta-ti list what the state of the art is for
this project, but I think it is supposed to work with meta-ti and
provide an alternative distro layer to Angstrom.


