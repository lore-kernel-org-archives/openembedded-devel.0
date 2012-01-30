Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pabigot@gmail.com>) id 1Rrv7R-0002S3-Q1
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jan 2012 18:34:18 +0100
Received: by wibhq7 with SMTP id hq7so3418690wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2012 09:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=PBtl9u1eQBXhrdO3JVWX5mCrS2KDahsfm5JvAKbNM1Q=;
	b=JPaQ0f19vMzJVuEGNLSEtcq4uXb2Sz68rSQlovQVHRXVFdAPG5GSwQUSSXmCANlKBz
	V7h4mltj/s+lWQ+Wn3tYQltleuMAj08dvbtKrLtmfOmnVeU4Shiz3VjOboSSvSgWbyZf
	XVSeP60Osmuy/1dO7iBgs4i2uPx4FepgP5b/4=
MIME-Version: 1.0
Received: by 10.180.107.68 with SMTP id ha4mr3257665wib.9.1327944385273; Mon,
	30 Jan 2012 09:26:25 -0800 (PST)
Sender: pabigot@gmail.com
Received: by 10.216.90.204 with HTTP; Mon, 30 Jan 2012 09:26:25 -0800 (PST)
In-Reply-To: <201201112330.53226.schnitzeltony@gmx.de>
References: <1325986434-2020-1-git-send-email-schnitzeltony@gmx.de>
	<jeeci3$i8k$1@dough.gmane.org>
	<CAP9ODKrgJKaW3EOjBRfXDd0rr+XWRjZTPL4Gx9RFxOASdG6Ccg@mail.gmail.com>
	<201201112330.53226.schnitzeltony@gmx.de>
Date: Mon, 30 Jan 2012 11:26:25 -0600
X-Google-Sender-Auth: MxE4MIde46mQUocyWzDie2TFSIw
Message-ID: <CAPOJ94O+AtdagBnCnAHHD2DvRGkAAodc8WSJas1CDmGqZqpMgg@mail.gmail.com>
From: Peter Bigot <bigotp@acm.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] udisks: add sytemd to DEPENDS
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
X-List-Received-Date: Mon, 30 Jan 2012 17:34:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 11, 2012 at 4:30 PM, Andreas M=FCller <schnitzeltony@gmx.de> wr=
ote:
> On Monday, January 09, 2012 12:29:47 PM Otavio Salvador wrote:
>> On Mon, Jan 9, 2012 at 07:38, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>> > I'm not sure this is the right solution, but I'll take the patch if
>> > someone doesn't come up with a better way to solve this.

Seems this patch is also necessary for building from the current master.

>> The right fix is to handle it in systemd.bbclass and bump every package =
PR
>> using it.
> Can we agree on that? I would volunteer to prepare these patches.

Is this still the plan?

Peter


