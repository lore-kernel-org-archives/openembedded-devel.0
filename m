Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slightlyunconventional@gmail.com>)
	id 1OnDgo-0001OY-DY for openembedded-devel@lists.openembedded.org;
	Sun, 22 Aug 2010 18:46:37 +0200
Received: by wwe15 with SMTP id 15so2974846wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Aug 2010 09:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=d1x/NRDYo3LXs/RE0kPRoMnXA2hFxmki+vZN0u9lir8=;
	b=kcU7+lTC9l3gNIdATrUUugLDk7CHCeY3F9vmZkAg4vTEvnrXgWWMP/saAduKQyVW4/
	KG3cFQZbssUsJG2vesfyEllGKqK5kET71nq9GJz0QvU0NAyr/rxDwhiFUc4TuE155Cno
	s6CnLnMMS/0+KlfZYe+Ryl0p0E/NyQn+4TZkE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=mr1uFGCtyjV02b9P2c01SjJOh4YNG3XVNKVLAhPyelBCtkl4VDXyjobpg2JZ6ddAID
	52ym2a5utxopNp+EcKwIcsOSL462JthfXx7SlzsnV1nZZYr6Z1rJKRLROTDVyNTNHNyR
	2JpE9/Lt77yDND8QjSLwf1Oe7owY8Z7fcp/bM=
MIME-Version: 1.0
Received: by 10.227.134.144 with SMTP id j16mr3624077wbt.50.1282495570942;
	Sun, 22 Aug 2010 09:46:10 -0700 (PDT)
Sender: slightlyunconventional@gmail.com
Received: by 10.227.134.211 with HTTP; Sun, 22 Aug 2010 09:46:10 -0700 (PDT)
In-Reply-To: <AANLkTinOcOEsWCF=oaqta+io5ymwP_bfiMWJJXqm02jw@mail.gmail.com>
References: <AANLkTinOcOEsWCF=oaqta+io5ymwP_bfiMWJJXqm02jw@mail.gmail.com>
Date: Sun, 22 Aug 2010 09:46:10 -0700
X-Google-Sender-Auth: ttsga5h2IyIgJ99M2khVUztfLB4
Message-ID: <AANLkTi=EkASHaQyXGqabEYJm3R+yPAJskM25UA6x4wLg@mail.gmail.com>
From: Hollis Blanchard <hollis@penguinppc.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: slightlyunconventional@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: meta-toolchain can't find libstdc++-dev?
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
X-List-Received-Date: Sun, 22 Aug 2010 16:46:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 20, 2010 at 9:13 AM, Hollis Blanchard <hollis@penguinppc.org> w=
rote:
> % bitbake meta-toolchain
...
> | Collected errors:
> | =A0* satisfy_dependencies_for: Cannot satisfy the following
> dependencies for task-sdk-host:
> | =A0* =A0 =A0binutils-cross-sdk * =A0 =A0gcc-cross-sdk * =A0 =A0 =A0 =A0=
 gdb-cross-sdk
> * =A0 =A0 =A0 =A0 opkg-sdk *

For the record, this seems to have been caused by inconsistent state
in my tmp/ directory. I deleted the whole thing and rebuild from
scratch, and no errors this time.

-Hollis


