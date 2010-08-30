Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Oq79p-00051z-Br
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 18:24:37 +0200
Received: by wyg36 with SMTP id 36so6215583wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Aug 2010 09:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=oA9mKn/S+NBbihtvzjNSDawqaH31R1aUL8eHCSFSoC0=;
	b=GQ3Nls7wW3ZXgfoRQTzp4KUvIcAjE0ZTzkZ/+LovERlF01qNy7tOq93R78KYPe4UQN
	wWnl1PS+q2CyzmfMk89QGy+JwNlX2zXw8AlY7hLs74UAFVoXts6CWFYy9hkN3HXB1KHh
	qx65URF8EIW0qVGZf5VlkJgfH3RPr8U8dM+wI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=hrrBjZN1PQ0KdopCnlXLhe5q7DmwYRBXL8vydPlobDe/sOKUENW0vVSAODpozDNYjN
	DBgnLOZnSx09UH1dGxpROYersy4IXeeVN1ExEOua/76H63OUXMDnxVHX4WG6yHk83ilS
	8D9IYWcUbZ4wMsMNrssZgE2VHEf+PYQ1skDP8=
MIME-Version: 1.0
Received: by 10.227.157.198 with SMTP id c6mr5088405wbx.144.1283185430667;
	Mon, 30 Aug 2010 09:23:50 -0700 (PDT)
Received: by 10.216.21.209 with HTTP; Mon, 30 Aug 2010 09:23:50 -0700 (PDT)
In-Reply-To: <1283184935.3795.27.camel@mattotaupa>
References: <AANLkTimgF4zbXEyzYK-BQqtgiv2fk1rvgi3W4MdfQ5Wt@mail.gmail.com>
	<201008301808.10029.marcin@juszkiewicz.com.pl>
	<1283184935.3795.27.camel@mattotaupa>
Date: Mon, 30 Aug 2010 12:23:50 -0400
Message-ID: <AANLkTiks-DBTmVRgdvhXW8dEfDFjAU_h5+BvtSuCBpKe@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: branch namespace clutter
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
X-List-Received-Date: Mon, 30 Aug 2010 16:24:38 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 30, 2010 at 12:15 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Am Montag, den 30.08.2010, 18:08 +0200 schrieb Marcin Juszkiewicz:
>> Dnia poniedzia=B3ek, 30 sierpnia 2010 o 17:56:52 Cliff Brake napisa=B3(a=
):
>
>> > If there are any branches in the OE git repo that are no longer in
>> > use, please let me know and I'll delete them. =A0Our branch namespace =
is
>> > getting rather cluttered.
>>
>> Drop:
>> hrw/linux-updates
>>
>> Most of those >1y old branches got merged or are totally obsolete.
>
> I think creators of these branches can delete those themselves.
>
> =A0 =A0 =A0 =A0git push origin :hrw/linux-updates
>
> Where origin is the name of the remote OE repository.

Yes, this would normally be the case, but deleting remote branches is
disabled in this repository due to a hook we have installed on the
server.  So the only solution is for someone who has shell access on
the server to delete them directly in the repository.

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


