Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PIr1q-0005GQ-Oa
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 00:03:03 +0100
Received: by wwb13 with SMTP id 13so626807wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 15:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=qRVd3AZvwmJUiEajUluAK+12EiPECiBCs76McISlh6s=;
	b=AaUErUk6N7xE5LIvff5sexABSks4R434VJwbXKqAPO0qCCrqyXGefWUJDmXpNpprCd
	vgrvWryKY5pFdCBTWp1uSBmNgPd7nNyxvBC50Usbg4A87tfTDCvb5aVRMZZPMLmxMPM+
	UZHgyU5/lBGwgRjJdskOqSUp+Idn7PR1vrs3Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=TMAp6Gbl6Q1bz3HF/dSQQ2HkXkFvevfRGbTEg0KMpFRRslTWK4v6L/XqKRfOeVfM8F
	ruH3RRKxHCO9ko5bjkO0DQry9YR3c/1U1D7dgybBe+ZgiZS16PQi0WwgYS7rMGeLZ0nu
	t+LzXfCVkOogGD3j2ubzZxzquBoCVx4iEBDoE=
MIME-Version: 1.0
Received: by 10.227.135.9 with SMTP id l9mr9985074wbt.49.1290034913772; Wed,
	17 Nov 2010 15:01:53 -0800 (PST)
Received: by 10.227.32.147 with HTTP; Wed, 17 Nov 2010 15:01:53 -0800 (PST)
In-Reply-To: <4CE3E8B8.3060505@opendreambox.org>
References: <4CE3E8B8.3060505@opendreambox.org>
Date: Thu, 18 Nov 2010 09:31:53 +1030
Message-ID: <AANLkTi=9CQqmWf4eHQmuE8Drcz5sjwey53JFdV_MGim-@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: versions in RDEPENDS etc.
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
X-List-Received-Date: Wed, 17 Nov 2010 23:03:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 18 November 2010 01:07, Andreas Oberritter <obi@opendreambox.org> wrote:
> Hi all,
>
> looking for examples in Git, I found the following entries using
> "(<$version)":
>
>> $ git grep -E '^(RDEPENDS|RPROVIDES|RRECOMMENDS|RSUGGESTS|RREPLACES|RCON=
FLICTS)' =A0| grep '<'
>> recipes/networkmanager/netm-cli_0.2.bb:RDEPENDS_${PN} =3D "python-dbus p=
ython-pygobject python-textutils networkmanager (>=3D0.6) networkmanager (<=
0.7)"
>> recipes/wireshark/wireshark_1.2.6.bb:RCONFLICTS_${PN}-tshark =3D "tshark=
 wireshark (<1.0.5)"
>> recipes/wireshark/wireshark_1.2.6.bb:RREPLACES_${PN}-tshark =3D "tshark =
wireshark (<1.0.5)"
>> recipes/wireshark/wireshark_1.2.6.bb:RCONFLICTS_${PN}-wireshark =3D "tsh=
ark wireshark (<1.0.5)"
>> recipes/wireshark/wireshark_1.2.6.bb:RREPLACES_${PN}-wireshark =3D "tsha=
rk wireshark (<1.0.5)"
>> recipes/wireshark/wireshark_1.2.6.bb:RCONFLICTS_${PN} =3D "tshark wiresh=
ark (<1.0.5)"
>> recipes/wireshark/wireshark_1.2.6.bb:RREPLACES_${PN} =3D "tshark wiresha=
rk (<1.0.5)"
>
> From what I've read, the control file format of opkg should match the
> control file format of debian packages. Also, it looks like the
> variables grepped for above are written unmodifed to control files.
>
> The Debian Policy Manual [1] states: "The relations allowed are <<, <=3D,
> =3D, >=3D and >> for strictly earlier, earlier or equal, exactly equal,
> later or equal and strictly later, respectively. The deprecated forms <
> and > were used to mean earlier/later or equal, rather than strictly
> earlier/later, so they should not appear in new packages (though dpkg
> still supports them)."
>
> Also: "For consistency and in case of future changes to dpkg it is
> recommended that a single space be used after a version relationship and
> before a version number;"

Opkg treats < and > the same as <=3D and >=3D, just like dpkg.

> Should the recipes be updated accordingly? Would such changes require PR
> bumps?

I think it would be prudent to determine if these dependencies were
meant to be << or <=3D. I guess it is unlikely that they mean <=3D, given
the common understanding of the '<' operator in other languages and
the deprecated nature of this operator in the debian policy manual.


> Regards,
> Andreas
>
> [1] http://www.debian.org/doc/debian-policy/ch-relationships.html
>

-Graham


