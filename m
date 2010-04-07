Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1NzUhZ-0001le-1a
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Apr 2010 14:49:49 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 0A761EA4CD
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Apr 2010 08:46:29 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Wed, 07 Apr 2010 08:46:29 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type:content-transfer-encoding;
	s=smtpout; bh=iGU1xwUkzHUiSdxeuTDWI/qWvoI=;
	b=Kgv3FYyP+i8RsCq59SDduvfRNZRskLLMBATSx1ITSoVedFzWmlY/N9WvgsOeyAnmHoT5IBdemIb3EpKdEXtpxL0qVlNOII6Kg42aLgdjjs8G9eltq+v8W0seXCglv4v3NTSWyGPgGl+EF127LPknn32OKDppCHFXye21ODT0ktk=
X-Sasl-enc: UKBcFV51AZ2zEN/fGOdisteCAgN3gYIinvcePNQKpN+q 1270644388
Received: from vitus.devnet.local (unknown [212.144.247.210])
	by mail.messagingengine.com (Postfix) with ESMTPSA id B3DF34CBE3A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Apr 2010 08:46:27 -0400 (EDT)
Date: Wed, 7 Apr 2010 14:46:24 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201004071413.56300.marcin@juszkiewicz.com.pl>
Message-ID: <alpine.DEB.1.10.1004071427430.3313@vitus.devnet.local>
References: <alpine.DEB.1.10.1004071258530.3313@vitus.devnet.local>
	<201004071413.56300.marcin@juszkiewicz.com.pl>
User-Agent: Alpine 1.10 (DEB 962 2008-03-14)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.26
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: recipe to always fetch latest from SCM
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
X-List-Received-Date: Wed, 07 Apr 2010 12:49:50 -0000
Content-Type: TEXT/PLAIN; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Wed, 7 Apr 2010, Marcin Juszkiewicz wrote:

> Dnia =C5=9Broda, 7 kwietnia 2010 o 14:00:47 Vitus Jensen napisa=C5=82(a=
):
>
>> What is the best way to code a recipe which always fetches HEAD from a
>> SCM?
>
> SRCREV =3D "${AUTOREV}"

Hurray!

>> Without accessing mirror servers first?
>
> CVS_TARBALL_STASH =3D ""
> SRC_TARBALL_STASH =3D ""

CVS_xxx?  Test, yes, strange though.

> Those two should make build try to use latest version each time.

Thank you for your help, it does!

For reference: this fills the download directory with archives for every=20
revision, one has to clean up regulary.

Bye,
   Vitus

--=20
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


