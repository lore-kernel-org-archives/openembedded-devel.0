Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PmWtq-0006Pw-4V
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Feb 2011 20:37:26 +0100
Received: by gwaa12 with SMTP id a12so1886624gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Feb 2011 11:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=mrgt/BeOQyyWryLCNzcSNLkH5ugVhVVVeTr5LvtZ/TQ=;
	b=FZFAC5lMp5g5nMYBKOH5c88h20bF0Ee+xlQ0nGJUgI/yt4GW/oHkj1eC787ulGuADg
	a4mzrmw4I8Y9lhoBg1jL4xC5t1Ik92YyuZxyXeiiIFPRJt0gcwr1F133olFBuz5kEG9a
	iLe0nQzZ1WxyMpohssaQp7GKmKLvKdntNxLKU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=ZSJK+NBvPMz0Zaj+TSb97GhavAaCfaTfmN37Hipc6fOWtKtkLk9DZi6s1PrKLzRlqK
	pfpxuTqBtNB1X62TXJNBA3DgJbO5N9sg/VktsHEjkYhWsZdXTuwYT7u6jvp/ahZ9Gn5u
	VAic3OfmrDUHNJF5Md7nUI8tCCP3Jy7NgS8js=
Received: by 10.90.73.4 with SMTP id v4mr10148147aga.88.1297107382759; Mon, 07
	Feb 2011 11:36:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Mon, 7 Feb 2011 11:36:01 -0800 (PST)
In-Reply-To: <20110207160841.GB29011@excalibur.local>
References: <20110126102308.GA29416@excalibur.local>
	<4D3FFB03.9010206@xora.org.uk>
	<4D4035D2.9090203@mentor.com> <20110207160841.GB29011@excalibur.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Feb 2011 11:36:01 -0800
Message-ID: <AANLkTiniBzwLJEqpedrY3Kg-yX==g3XXTxsqZCyef=+q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OE 2011.03 release vs. oe-core migration
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
X-List-Received-Date: Mon, 07 Feb 2011 19:37:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 7, 2011 at 8:08 AM, Stefan Schmidt
<stefan@datenfreihafen.org> wrote:
> Hello.
>
> On Wed, 2011-01-26 at 07:55, Tom Rini wrote:
>> On 01/26/2011 03:44 AM, Graeme Gregory wrote:
>> >On 26/01/2011 10:23, Stefan Schmidt wrote:
>> >>
>> >>During last OEDEM we set out a timeline for quarterly releases. The fi=
rst one
>> >>hit on time in december 2010 (Thanks Khem).
>> >>
>> >>The next one would be scheduled for 2011-03. As our plans towards oe-c=
ore are
>> >>getting into shape I wonder if and how these both are going to conflic=
t.
>> >>
>> >>Will we go ahead and make the 2011-03 release, maybe the last one befo=
re moving
>> >>over to oe-core? Personally I don't think these two block each other. =
Syncing
>> >>would be needed, but people will keep working on the OE repo for a bit=
 longer
>> >>anyway I would think.
>> >>
>> >>If we are going to scratch the release what would be the next target f=
or it?
>> >>Yocto 1.0 is planned for April 2011. Somehow I doubt we will have oe-c=
ore ready
>> >>for this in time, including yocto movs to it and we base the rest of O=
E on top
>> >>of it. Am I wrong here and that is the actual plan?
>> >>
>> >>
>> >My opinion is 2010-03 should be the last release on the old source tree=
.
>> >Releases after this should be on the new oe-core layer system. I don't
>> >think we should scrap the release as its going to take some time to kic=
k
>> >oe-core into shape and finish the poky merge. Then there is work on
>> >meta-openembedded and meta-distro to do on top of that.
>>
>> I think this depends a little on who is going to run the release
>> again. =C2=A0We probably won't have a perfect release, stop committing,
>> switch. =C2=A0If we're looking for volunteers again to run the next
>> release, assuming folks will be busy with the migration work too,
>> I'd throw my hat in the ring (and defer to Khem if he wants to do it
>> again, along with all of the fun we'll have in oe-core :))
>
> I would welcome if we could make the release manager role rotating. So if=
 Tom
> would be able to pick this up it would be great if Khem can feed him some=
 of his
> experience with the last release. Be it only theoretical with some hints =
or
> practically with helping to review and apply patches towards. Does this s=
ound
> good to both of you?

by all means. I would do it if no one else is doing.

>
> I will do some more testing over the next days/weeks and also trying to h=
elp
> with some patches if needed.

We need more people to sign up for testing the release
>
> regards
> Stefan Schmidt
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


