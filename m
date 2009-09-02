Received: from [209.85.218.210] (helo=mail-bw0-f210.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MieTM-0004yy-OA
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Sep 2009 03:17:16 +0200
Received: by bwz6 with SMTP id 6so397117bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Sep 2009 17:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=L44K+RaOjNPiDwNDhEjKkkFN6hCPLZrWmMQa0lJS5Ok=;
	b=t2e85Qjyd9DCc4kLHlX/c/VFwU71Hxw8NkZv+ULv4ShL9yfyLav9Zxsh5GASdiYTcu
	2QN1sJdHWm/0pZrTrjd5xSNex9I7G5+rwuC31fxi8lBVliapl6LwftWT/7T9Wende/EM
	tfK1RiraeJNvAl64HL8Q8aycuwFhTw/NM4W78=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=nQzA6XWJUPGdiGb1qlV1n+PdEajSqUqX9y0m4BwyeYZCEAAWtw/LaBhPBwC76jiQNM
	hh5cg7GbjV7vpEz+0cwIyRivAcA52u9rXE7sdF+XbPthQGHrkVK2QN2hK4tzp/q/Bzd9
	MlCgY4jWNHQghZxpqKBm/MUunfghwU5jAISjc=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.182.137 with SMTP id q9mr678790hbg.72.1251853114284; Tue, 
	01 Sep 2009 17:58:34 -0700 (PDT)
In-Reply-To: <b6ebd0a50909011618m2bf76503jb1d83f800034d076@mail.gmail.com>
References: <b6ebd0a50908261905r7d839647k6fc53460301efca0@mail.gmail.com>
	<be7a9f3d0909010638h75451d65la4a599a1583c3208@mail.gmail.com>
	<b6ebd0a50909010924u4f9a1ee5jebfae98afb2462e6@mail.gmail.com>
	<be7a9f3d0909011529g61920aav8c9308207ae51d3e@mail.gmail.com>
	<b6ebd0a50909011618m2bf76503jb1d83f800034d076@mail.gmail.com>
Date: Tue, 1 Sep 2009 21:58:34 -0300
X-Google-Sender-Auth: 868b41786acda05e
Message-ID: <be7a9f3d0909011758u75c45fdfg43e243804c5971cc@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: srctree & gitver
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
X-List-Received-Date: Wed, 02 Sep 2009 01:17:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Sep 1, 2009 at 8:18 PM, Chris Larson<clarson@kergoth.com> wrote:
> This doesn't answer my question, however. =A0You wouldn't be able to
> safely use AUTOPV in PV unless you're pointing S to an existing
> non-fetched git repository, since PV would change before and after the
> fetch, so I was attempting to clarify this. Since you can't use it
> safely for fetched sources, it doesn't really belong in bb.fetch.

Sorry but you're wrong. When evaluating the cache it checks if remote
has been change. So it works quite well and we're using it since April
;-)

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


