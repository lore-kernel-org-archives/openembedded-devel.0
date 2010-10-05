Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1P39bs-0004cw-V2
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 17:39:23 +0200
Received: by qyk8 with SMTP id 8so5002631qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Oct 2010 08:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=EEL/EDg2Z5JUcHP0eIdNIpSpKPmvgUvMx2OSyynUzNQ=;
	b=sAP+W1MEvKgZLukL4k0oamzBrlGFpN88UKhbYftR35aY4zJoyzzQQdS6mnQpSu568k
	8gu1zPLXrQzjNmeTLcuO7Cs6a9qhITwN2p3gW2YM39dHuSpPFZWo48oQk2ddbhN/pgya
	VzPyVafgNBd1xBHQ5jqGs9QcWa1BkKtP6rRAQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=sFRkKqt+2MnQwsOmp0RCoWZy5J05HXNB6tmOeTqeQOAua9xnmv8QZgHimK6RTGaNB1
	jY68B5t+9Dl0FalLnIa/O7ilJQbYKLkMJF2+NZnwIdUngmgob+WWEjlM66ie98qeERQj
	Uy7gjLj6Bxdlpjz8QfQkTni1seotX6lnD3fEU=
MIME-Version: 1.0
Received: by 10.224.80.203 with SMTP id u11mr8294691qak.355.1286293140476;
	Tue, 05 Oct 2010 08:39:00 -0700 (PDT)
Received: by 10.229.32.83 with HTTP; Tue, 5 Oct 2010 08:39:00 -0700 (PDT)
In-Reply-To: <4CAB2FBD.6060401@freyther.de>
References: <4CAB2FBD.6060401@freyther.de>
Date: Tue, 5 Oct 2010 19:39:00 +0400
Message-ID: <AANLkTikFS-A1T_tiu5_4ajBk=BKJU3Q=O4wqP2XcTxwf@mail.gmail.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Holger Freyther <holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: dbaryshkov@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Latest qt4-sdk-tools* patch is wrong
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
X-List-Received-Date: Tue, 05 Oct 2010 15:39:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 5, 2010 at 6:01 PM, Holger Freyther <holger+oe@freyther.de> wro=
te:
> Hi Dmitry,
>
> your latest change is wrong. You apply a patch (that is not mentioned in =
the
> commit message) that does not exist in the tree. Your patch to
> qt4-tools-sdk.inc is also wrong. qt4-tools-sdk.inc is only used by
> qt4-tools-sdk_4.7.0.bb which is using -embedded and -no-freetype... so ad=
ding
> the patch and the extra includes is not correct (and you probably should =
have
> bumped INC_PR in that file).

Commited fixes for this.

> For Qt 4.6.3 I would propose building the tools with --no-freetype as we =
have
> no interest in GUI anyway.

I'll look into that.

> I hope you can fix that soon.
>
> =A0 =A0 =A0 =A0thanks.
>



--=20
With best wishes
Dmitry


