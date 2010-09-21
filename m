Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OyCMI-0000Lw-FI
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 01:34:48 +0200
Received: by iwn2 with SMTP id 2so5674001iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 16:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=pHud+tXa+mBZ3/L6tb3dmFmb0LfTlhjY7nJ1M5eoDn0=;
	b=LJDOzaOg0ymELdzIb8QNdtzwgnHHY9QDGqYLGP0qAQ91YhD4A4wTmhQQi5qAURpNjL
	BCXQfb0ezZfEThZHtx60HdY1lnoazEpHMRjjznX38rMAGhJqVrjKf2atOji6mPGgabfn
	fPS+KCG90KAMu80IQICIs+4IBuXEWbwfQfKwA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=ur/5QWZhDviwVDAgM/WhUzjB1F5Z/+DUIXlC+WDPA2e/iTBPn7DM4g+ksWZsyhttpc
	ddZWI8o1EnDDDlNELjwseHOdhrp1g/Y8JlG4yjT/0q5Lb5Cx8e4yp5xRKTi1BljQvgPr
	hS9zm9oyyJd6OU/QVBoctBl9jUOVgp/W2tZRU=
Received: by 10.231.155.206 with SMTP id t14mr12826629ibw.34.1285112083138;
	Tue, 21 Sep 2010 16:34:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.200.194 with HTTP; Tue, 21 Sep 2010 16:34:23 -0700 (PDT)
In-Reply-To: <4C991B82.3090803@cbnco.com>
References: <4C97AC2B.1040205@cbnco.com>
	<AANLkTikd-8b1oMbyVus7372HT7u9KON0rx_nZM9fn-8A@mail.gmail.com>
	<4C98B9F0.2010005@cbnco.com> <4C98EC64.3040203@freyther.de>
	<4C991B82.3090803@cbnco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Sep 2010 16:34:23 -0700
Message-ID: <AANLkTimSLnwKB0XchkPk56QpGDa0ELDoo7X_6OqD5w02@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] base.bbclass: add make-native to default dependencies
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
X-List-Received-Date: Tue, 21 Sep 2010 23:34:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 21, 2010 at 1:54 PM, Michael Smith <msmith@cbnco.com> wrote:
> Holger Freyther wrote:
>>
>> On 09/21/2010 09:58 PM, Michael Smith wrote:
>>>
>>> I could add a DEFAULT_PREFERENCE =3D "-1" to the 3.82 recipe and mentio=
n
>>> the
>>> packages that don't build with it in a comment. Do you remember which
>>> packages
>>> fail to build with 3.82?
>>
>> well, busybox, glibc, gst* have failed and were fixed. In general I have
>> hit:
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0- mixing 'rule %rule:', newer GNU make refuse=
s to match that
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(busybox, glibc)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0- spaces vs. tab. e.g. using 8 spaces instead=
 of a tab (gst)
>
> Maybe it'd be easier to fix the affected packages, then. Would you be
> opposed to make-native being a default dep? The next testing cycle would
> probably spot any remaining fallout from 3.82.
>

make is a core component. We have enough fallout to fix
which is not make related. this will add to it. and make
3.82 native recipe is there. I am just not ready to make
it default yet.

> Mike
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
-Khem


