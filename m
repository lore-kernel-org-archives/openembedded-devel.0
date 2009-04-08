Received: from [74.125.46.154] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1Lrc9z-00035f-F8
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 20:06:17 +0200
Received: by yw-out-1718.google.com with SMTP id 9so159952ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Apr 2009 11:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=TEHCoaxOGZ7fzpdbCel4rKWVchxe0+/D6CZqXIAo7NI=;
	b=YEuDuct2MNlvOQD8Rl3hQoZX1m9NSyvCRyclHwgq40SN7+ftU808PSfKNiAfQc8otv
	GnZhjS4tx0iVVbZ/OgMVMJ0W6g/RT/2ebda31apmKigMx0YWWexvgekH8s3VdLIT75y+
	Zm0gOIISh31ChgD0Iv1Gr7DvKCVF/OtdAl+Wk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Fw6XNFEI3vtPjiJsPPtCJYq5lSFK3Xj7KS2wI6utVgBMHf7rqGEOrnFkVnacf5hRq5
	/7+bP28318y7LGyJz+BR1TVD1gWhURZWR4UhukLuOLZKC0/cSnRaWafjk7tlgT4xqWuR
	kIgdqkNTIoKwQAGktK+a8bhg5dLaa8H0pG/oQ=
MIME-Version: 1.0
Received: by 10.100.125.9 with SMTP id x9mr3610396anc.35.1239213779150; Wed, 
	08 Apr 2009 11:02:59 -0700 (PDT)
In-Reply-To: <20090408175055.GM2195@smtp.west.cox.net>
References: <d2b9ea600904070016j5826cdbex6271177286c66c87@mail.gmail.com>
	<20090407165123.GE2195@smtp.west.cox.net>
	<d2b9ea600904080716y5776086fu8521915fa402f694@mail.gmail.com>
	<gric5v$qc4$1@ger.gmane.org>
	<d2b9ea600904080952g656823dby8c15a46b425f76c6@mail.gmail.com>
	<49DCE11F.90903@balister.org>
	<20090408175055.GM2195@smtp.west.cox.net>
Date: Wed, 8 Apr 2009 20:02:59 +0200
Message-ID: <d2b9ea600904081102k6e6e5c95r554c3d9111749e39@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.46.154
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=AWL,BAYES_40,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH v2] mingw-binutils: update to 2.19.1
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
X-List-Received-Date: Wed, 08 Apr 2009 18:06:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2009 at 7:50 PM, Tom Rini <trini@kernel.crashing.org> wrote:
> On Wed, Apr 08, 2009 at 01:38:39PM -0400, Philip Balister wrote:
>> Esben Haabendal wrote:
>>> On Wed, Apr 8, 2009 at 4:26 PM, Koen Kooi <k.kooi@student.utwente.nl> w=
rote:
>>>> On 08-04-09 16:16, Esben Haabendal wrote:
>>>>
>>>>> Then, please someone apply this to .dev. =A0But then how are we suppo=
sed
>>>>> to remember which patches should also be moved to stable, and when?
>>>> If you want something in stable, you send the patch to this mailinglis=
t with
>>>> [STABLE] in the subject.
>>>
>>> Which is exactly what I did. =A0Now 3 times even.
>>
>> I suspect the problem is most of the people interested in stable do not
>> know what this patch does. I admit to skimming over things that look
>> like patches to pieces of OE that I know little about.
>>
>> Still, we need a way to get this sort of thing into stable, even when it
>> is outside the scope of most of the reviewers.
>
> Hang on. =A0I (the guy signed up to own this part of stable) have reviewe=
d
> it each time. =A0The problem is there's been both general little problems
> and Esben has wanted the patch to go in both trees at once, which isn't
> how I understand Stable to work.
>
> My plan right now is to fixup the still minor problems in v3 and post
> for stable momentarily.

That is fine.  And it is also good that we improve the quality of the
metadata when changing stuff.
But it is just surprising that when I copy an existing recipe file to
add a new version, it gives rise to so much need for improvement.
The existing file were committed by yourself, although it originates
from my canadian sdk work, but I maybe we could use time a bit more
efficient than nitpicking to much on selected commit(ter)s. That said,
it is always nice to have the best possible end result :-)

/Esben


