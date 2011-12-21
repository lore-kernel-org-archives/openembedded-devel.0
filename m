Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RdVGy-0006mR-JC
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Dec 2011 00:08:32 +0100
Received: from [192.168.2.10] (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id F411EA659F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2011 00:01:23 +0100 (CET)
Message-ID: <4EF26542.80606@eukrea.com>
Date: Thu, 22 Dec 2011 00:01:22 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1324487359-3748-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1324487359-3748-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [meta-oe][PATCH] gcc-4.5: Update gxx headers patch
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
X-List-Received-Date: Wed, 21 Dec 2011 23:08:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Le 21/12/2011 18:09, Khem Raj a =E9crit :
> This patch now expects gxx-include-dir
> to be specified under sysroot which we
> already do through gcc-cross4.inc from
> oe-core
>
> Please test
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
Tested-by: Eric B=E9nard <eric@eukrea.com>

with this patch I manage again to succesful build some images which were=20
sometimes failing with c++ header not found (especially with BB_THREAD_NU=
MER > 4).
This doesn't explain why sometimes these image were building fine.


