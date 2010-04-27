Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1O6lYL-0002H5-6l
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Apr 2010 16:14:34 +0200
Received: by vws1 with SMTP id 1so35398vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Apr 2010 07:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=EfKFi/4W0Tqj9HUFI/LEjTYkxhgifTC1JzdQcz+0AhA=;
	b=ojY7vGQBWREo14Bc/yD1a6/whRvbESrjzN+118meaKx9JWHo96lJQDla47l6sKM9PE
	oDqdfJn2IFEBbHmynVAylrzJOsJkqp0OQy0oqIL+Z3pdQYhYs6LZvFzn15qVqZWlQlM+
	Ls8XMMXx4kxsWNMoVGmRT89APbl9jSB2ZMhw0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=ecQYRF69XUmecZrRPg4qqm/mzHrDpwrnFJhlSholGKGvTt4dtvMsWOJdItk3x2+Sg0
	5qeCRx2Mp+0js99RGEVdSQlREqY9m0XzUdo2ThYbILDxG7sQzmEZTT0uZRVdGTOZwv+X
	CYh9+qZs+dKNzbQiCyDMN76S/wP0eCdvd1nCY=
Received: by 10.229.224.133 with SMTP id io5mr2192557qcb.37.1272377440156; 
	Tue, 27 Apr 2010 07:10:40 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.188.213 with HTTP; Tue, 27 Apr 2010 07:10:20 -0700 (PDT)
In-Reply-To: <1272354815-21542-1-git-send-email-mchazaux@adeneo-embedded.com>
References: <1272354815-21542-1-git-send-email-mchazaux@adeneo-embedded.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 27 Apr 2010 07:10:20 -0700
X-Google-Sender-Auth: a4bcc79d5fb71aa4
Message-ID: <w2wb6ebd0a51004270710udf58d331s57b35563f38b09de@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: =?UTF-8?Q?Micka=C3=ABl_Chazaux?= <mchazaux@adeneo-embedded.com>
Subject: Re: [PATCH] Add error handling to read_cache in stage-manager
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
X-List-Received-Date: Tue, 27 Apr 2010 14:14:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2010/4/27 Micka=C3=ABl Chazaux <mchazaux@adeneo-embedded.com>

> Sometimes stage-manager crashes with this message :
> Traceback (most recent call last):
>  File
> "/home/mchazaux/projet/OE/openembedded/recipes/stage-manager/files/stage-=
manager",
> line 79, in <module>
>   cache =3D read_cache(options.cachefile)
>  File
> "/home/mchazaux/projet/OE/openembedded/recipes/stage-manager/files/stage-=
manager",
> line 34, in read_cache
>   cache[data[0]]['ts'] =3D int(data[1])
> IndexError: list index out of range
>
> This is due to a corrupted cache file. This patch adds an error message
> and continues parsing ignoring the wrong line. The file is then properly
> regenerated.
>
>
You forgot a Signed-off-by, best off doing a commit -s in the future.  Look=
s
okay to me.

Acked-By: Chris Larson <chris_larson@mentor.com>
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

