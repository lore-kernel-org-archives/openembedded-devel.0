Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PCrmI-0005Sx-Hd
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 11:38:15 +0100
Received: by iwn42 with SMTP id 42so6351270iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 03:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=wPpRbTNnHQ9qQsZqLqtegKMI+DodCF/Q71eiW1oR4b8=;
	b=u7YT7aoRf6B3XfKnlyEV1b+3tFag926HYoND67ydmWosBqnFfebLd4bwKVSIBNBbDe
	fWVZe5JHHfymv+7FTS5q66bXBLS7LKE67OWkOR7vo9/xxaoM4/5yMlWXU73k3sNLctoa
	rFMJKYAdCQ4+c9dehbwgCvLh518pUs8mqpC9w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=nFIKshXOp9zgGDM0J3gnS9wYun8/EIA2hhqPRzp2jHjgIdiNnOpfyE/Z0De+/Jhvdt
	7CMgQmvX4EIK9de4mJCL/Bb/yD/BEvz1ecgv0jh8AtZeAqL9KO0PHNDNH7+8kbWhSyle
	eS6W1isPEtN7TvOohlPkJz9N+/s2+JKFgOT1U=
MIME-Version: 1.0
Received: by 10.231.35.131 with SMTP id p3mr13285336ibd.177.1288607845967;
	Mon, 01 Nov 2010 03:37:25 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Mon, 1 Nov 2010 03:37:25 -0700 (PDT)
In-Reply-To: <20101101081956.GA3440@jama>
References: <AANLkTin70=KBJDjW8K6ViS5X03ZaE92680oR88hhy9eK@mail.gmail.com>
	<AANLkTimEKL_6r_DZmq_W2i9eqHPgbRFc-oFMftKNFBJv@mail.gmail.com>
	<iakpd7$ja7$1@dough.gmane.org>
	<AANLkTikmqiDqWpHS=K73N8z6a0VPU8k7zMCP7yrb=G-Y@mail.gmail.com>
	<20101101081956.GA3440@jama>
Date: Mon, 1 Nov 2010 11:37:25 +0100
Message-ID: <AANLkTikwumwg4Pmw49AzaT0j-QhjCbPF+kcAWcSJZbJQ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-29
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
X-List-Received-Date: Mon, 01 Nov 2010 10:38:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/1 Martin Jansa <martin.jansa@gmail.com>:
> On Mon, Nov 01, 2010 at 08:49:32AM +0100, Frans Meulenbroeks wrote:

>>
>> (btw: a good place would probably be [3] and yeah, I am aware of the
>> debian renaming [4], but I am also aware of [5] which as an example
>> says:
>> FILES_${PN} =3D "\
>> =A0 =A0 ${bindir}/* \
>> =A0 =A0 ${sbindir}/* \
>> =A0 =A0 ${libexecdir}/* \
>> =A0 =A0 ${libdir}/lib*.so.* \
>> =A0 =A0 .....
>> which was exactly what was in the original commit [6]:
>> +FILES_${PN} =3D "${libdir}/lib${PN}${SOLIB}"
>
> It's OK, but much better if you also PR bump packages depending on it.
> Because as long as "${bindir}/*" was included in FILES_${PN}, debian
> naming didin't happen (because of multiple binaries in 1 package), the
> same happens when you have multiple libraries in 1 package without
> LEAD_SONAME defined.

Which (at least to me) is highly confusing. I did not expect that
adding/removing things from FILES_${PN} would change the lib renaming.
This seems highly counter-intuitive to me.

Actually I'mkinda  flabbergasted when renaming does and when it does not ha=
ppen.
That is why I feel some doc is a good plan.

The same holds with the LEAD_SONAME and e.g. the GNU_HASH errors/warnings.
There are all quite common. It would be a good plan to have a page
somewhere describing the meaning of these messages and what to do with
them.
>
> So moving binaries to new FILES_${PN}-utils is probably good move, but
> as side effects it renames libcdio to libcdio5. And because already
> built packages have libcdio instead of libcdio5 in it's runtime depends,
> those needs to be rebuilt (to pick libcdio5 as libcdio.so provider)
>
> Not sure how to check all recipes depending on it (I don't trust DEPENDS
> as some packages are voluntary linked to libcdio just because autotools
> found it). So usually I notice it only when image build fails (opkg
> complaining about missing packages), but that works only for packages
> included in built image :/. And when I notice it, I usually do something
> like:
> find deploy/ipk/ -name Packages -exec grep -B 3 libcdio {} \;
> to see where wrong Depends is and then PR bump those (which still fixes
> only those recipes I'm building as part of some image or ie
> task-shr-feed)

You might want to extend your grep to DEPENDS lines.
Then again this is not trivial if DEPENDS is split over multiple lines
and the package same is something that occurs lots of times outside
the depends var.

In the case where you encounter a depends issue, I hope you also fix
DEPENDS (but actually I'm pretty sure you will :-) )
>
> sometimes it gets even worse, like in this case:
> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3D5fa427d069=
22297496fcf5ebd6c0a6a5c2adac46
> when edbus.ipk gets empty after moving all libs to separate packages, so
> it won't get upgrade on target and creates conflicts between old package
> containing ie libehal.so.* and new edbus-ehal.ipk providing the same lib
> in newer version.

Upgrading is sometimes a pita.

>
> Feel free to update wiki if you found this explanation (or at least some
> part of it :)) understandable.
>

See above.
The fact is that I am fairly time-constrained next few days. Came back
from elc/oedem last sun, have to leave for another trip upcoming sat
morning.

Have fun! Frans


