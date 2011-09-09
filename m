Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R282K-0003dH-OG
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Sep 2011 22:50:56 +0200
Received: by bke11 with SMTP id 11so757059bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Sep 2011 13:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=r0OKMRdmCOLQ0St1qxd4X5wWHqQnGZLlym5Zw9J/p24=;
	b=MebPnxHbQ7gE1JgEicjvhNNDuwIcFPm1KkQEDxr8g3Qz/ZCIGZWWUoRO+YDKQ2do4V
	ywkYNkXtk5D4eZRWTL2yrPbfSRKvM2WEZiEVUgBfiYrHjYlJ2Mbc7srhAIMLg8aFK7qi
	AfwnoQg7OzUIQ71rCnxPBDwdwV88IJgiR2Cao=
MIME-Version: 1.0
Received: by 10.204.3.23 with SMTP id 23mr237500bkl.301.1315601151541; Fri, 09
	Sep 2011 13:45:51 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Fri, 9 Sep 2011 13:45:51 -0700 (PDT)
Date: Fri, 9 Sep 2011 17:45:51 -0300
X-Google-Sender-Auth: NqLoc5_vQ5BCKWa56R81ACLik-4
Message-ID: <CAP9ODKr25u3yPbnAsS8Suc2wngTtJhDbn9egMXZZpUtLQqbZTg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe] X randr-support.patch breaks geode
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
X-List-Received-Date: Fri, 09 Sep 2011 20:50:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

I've been trying to figure out what XRandR stopped to work when we
updated our OpenEmbedded. After talking to Martin Jansa, on #oe, I
could find that reverting 'randr-support.patch' from X fixes this
issue.

Basically, when we change the resolution it swaps the pointer axis.
This is wrong, as you all can bet ;-P

Do someone has any clue WHY this patch breaks it and if we can drop
this from meta-oe repository? It seems to not be used on
OpenEmbedded-Core so seems to be quite specific to something related
from previous machine support. Maybe move it to the specific layer?

Cheers,

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


