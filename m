Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1OelMl-0002WC-6s
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 10:54:58 +0200
Received: by fxm12 with SMTP id 12so753667fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 01:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=lJwQK+5tGe9d4t2RS5n9BMpqS2SVVQS/oUoOMzmZv9Q=;
	b=uhKSv7OeDbWRmw3g35FvaqslXCQLXdPcktlioTDiZiyGrgl5rxve9r2WwLC2bi59OQ
	9AhULLxdJbeL5TLqCvquOVN/1bnkpojmI9zNg/WZ5UfFRYUOzkuPLTrjsVFmDQjN4Mw7
	GT2K2h75V2Elq8ZubnBBHxBRTTIWP8EerW2Tc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=w8yhupwfD7eny4bBc+YiwOMQmY6zb0+ChQNvxEuxVru0Kgf7wyBFAF1K/m/GXPXN9E
	c6NIwNQwuie83OEpABnAQspG9GGDMAijbgd+/NRYZHNLvWuN9B+Df78By2UEUXyLIMio
	4hEc9bUGuwo/z4G9xGvVwTSZh3i1NA1Y56Adw=
MIME-Version: 1.0
Received: by 10.239.158.71 with SMTP id t7mr85026hbc.88.1280480072071; Fri, 30 
	Jul 2010 01:54:32 -0700 (PDT)
Received: by 10.239.181.207 with HTTP; Fri, 30 Jul 2010 01:54:31 -0700 (PDT)
In-Reply-To: <4C528DC6.9060408@xora.org.uk>
References: <AANLkTimk_y-ntnLZpXfa_biLEcX_vO_Lk5PQXWPJcuec@mail.gmail.com>
	<i2rik7$ds1$1@dough.gmane.org> <4C516EF8.3080804@balister.org>
	<AANLkTikZQB39U7kUv9-0v-3gysX=tYFuwUiq3ygXJzAL@mail.gmail.com>
	<i2u23e$97d$1@dough.gmane.org> <4C528DC6.9060408@xora.org.uk>
Date: Fri, 30 Jul 2010 10:54:31 +0200
Message-ID: <AANLkTi=mxmnu_D-mXO4GjGqbWz19CN_J8k-zJrU5Hzde@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE recipe tree quality
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
X-List-Received-Date: Fri, 30 Jul 2010 08:54:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 30, 2010 at 10:31 AM, Graeme Gregory <dp@xora.org.uk> wrote:
> =A0On 30/07/10 09:22, Koen Kooi wrote:
>> On 30-07-10 09:21, Esben Haabendal wrote:
>> > On Thu, Jul 29, 2010 at 2:07 PM, Philip Balister
>> <philip@balister.org> wrote:
>> >>
>> >>
>> >> On 07/29/2010 05:45 AM, Koen Kooi wrote:
>> >>>
>> >>> -----BEGIN PGP SIGNED MESSAGE-----
>> >>> Hash: SHA1
>> >>>
>> >>> On 29-07-10 10:50, Frans Meulenbroeks wrote:
>> >>>>
>> >>>> Dear all,
>> >>>>
>> >>>> Given the discussions on quality that sometimes pop up (and also
>> >>>> triggered
>> >>>> by Robert's message), I decided to kick off a bitbake -k world.
>> >>>
>> >>> Could you first explain to me why 'bitbake world' is a good way to
>> >>> measure quality?
>> >>>
>> >>> I would think that building something like console-image and
>> looking at
>> >>> the following would be a much better metric:
>> >>>
>> >>> * does it build?
>> >>> * are all the rootfs types working?
>> >>> * does the image do what it is supposed to do?
>> >>> * Are all the licenses of the output packages correct?
>> >>> * Do the output packages have any spurious deps?
>> >>> * Is the content of the output packages correct?
>> >>> * Are there any known CVEs in the resulting packages?
>> >>> * Did packaged-staging do its job?
>> >>> * What kind of QA errors and warnings were raised?
>> >>> * Did all recipes pass recipe_sanity?
>> >>> * Did all recipes conform to oe-stylize.py?
>> >>>
>> >>> etc
>> >>>
>> >>> I would actually advocate removing the 'world' feature from bitbake/=
OE
>> >>> to stop people from wasting time on looking at bitbake world and hav=
e
>> >>> them fix actual problems.
>> >>
>> >> bitbake world seems to be the source of pointless listserv
>> discussions. Does
>> >> it serve any purpose?
>>
>> > Pointless or not really depends on how you look at quality.
>>
>> > If you look at it as you, Koen and other OE long-timers, yes, it looks
>> > rather pointless to have bitbake world.
>> > But for those of us who have a different view on what quality is, then
>> > bitbake world serves a purpose.
>>
>> As Thomas points out, as soon as you start blacklisting things (which
>> actually increases quality), bitbake world doesn't work anymore.
>> That alone should be enough to kill it.
> Time to jump in the cage here.

Welcome :-)

> "Quality" is achieved by comparing a set of known specifications against
> a known data set. In the software case this means we need a good set of
> specifications which we are testing against. We also need to know in
> detail what we are testing against this set of specifications.

That is by no means the definitive definition of "Quality" in software.

From http://en.wikipedia.org/wiki/Software_quality : Another
definition, coined by Gerald Weinberg in Quality Software Management:
Systems Thinking, is "Quality is value to some person." This
definition stresses that quality is inherently subjective - different
people will experience the quality of the same software very
differently. One strength of this definition is the questions it
invites software teams to consider, such as "Who are the people we
want to value our software?" and "What will be valuable to them?"

We should not assume that a community such as OE will agree 100% of
what software quality is, but we have to agree on what type of
software quality definitions we will work towards.

I am happy to see that I am not completely alone with my views on what
could improve the software quality of OE, but at the same time I
respect the fact that a lot of the most active OE developers have
different views on software quality.

But I believe everybody should respect that there are different
opnions on what quality is, and none of them should have complete
monopoly, hence the need for a continous discussion on software
quality of OE.

/Esben


