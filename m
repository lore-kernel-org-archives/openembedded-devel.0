Received: from [209.85.220.207] (helo=mail-fx0-f207.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MM4cH-0002Kv-Ny
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jul 2009 20:33:09 +0200
Received: by fxm3 with SMTP id 3so988803fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jul 2009 11:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=9OWFl+NgcMvH6FKOupfVWiATqHhgG2wnkYhNaQWubWA=;
	b=v6klKqlb3FqATOosGg8m5MJbCeUyu+NisEEYqXliVTCu8FbKfSuLaf57UO7VpdiIUV
	7KAtTQ/Thl2teG8e42GeWTNu7kcw6czSqanOAjr+us1pqYFi/n+f2OXYBla0WKxmPvhu
	lMdFqzm2dHKDEN4mH8RKgqrBav2KGRzE7ESfM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=UdV/HWMFxQFhFrkJKXmKwu6pl68bzLwwfUIhXMHAZxfOVqBm3ItYGd09gw9+KKPgCD
	ldO1rEqq7ZWSdlVXjDtYipKV+DLQ61RkXqpLm4JWZLO1RpPSV48ic/pt2QQZ2RZbDgNt
	tFrQo54knugNbVpgiMNKQgy2ZVX+K8orb9Glc=
MIME-Version: 1.0
Received: by 10.103.197.14 with SMTP id z14mr5763424mup.92.1246472471504; Wed, 
	01 Jul 2009 11:21:11 -0700 (PDT)
Date: Wed, 1 Jul 2009 21:21:11 +0300
Message-ID: <fce2a370907011121k3d082889xc6910fda9c21aee4@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Qt4 recipes and sql drivers
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
X-List-Received-Date: Wed, 01 Jul 2009 18:33:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello guys!
For my work project, I need to use Qt with Postgres and possibly
Sqlite. For this I modified current qt4.inc configure options and
DEPENDS. Seems to work fine.
The question is: should I enable functional sql drivers (as plugins of
course) in-tree? The only problem I see here is that compile time for
qt4 recipes will be a little longer (to build postgres and sqlite),
but runtime dependencies are not bloated with postgres/sqlite things
unless you really install the affected sqldrivers packages. If you
will approve this change then I'll send a patch to ML.
Thanks.


