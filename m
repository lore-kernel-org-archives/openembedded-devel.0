Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1PdNsx-0003nF-Rk
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 15:10:44 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id p0DDsvXt029780
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jan 2011 14:54:59 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>) id 1PdNdh-0005ds-N2
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 14:54:57 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <1294867230-7827-1-git-send-email-eric@eukrea.com>
	<1294867230-7827-2-git-send-email-eric@eukrea.com>
	<1294867230-7827-3-git-send-email-eric@eukrea.com>
	<4D2E47EE.2040801@mentor.com> <4D2EF927.8050504@eukrea.com>
Date: Thu, 13 Jan 2011 14:54:57 +0100
In-Reply-To: <4D2EF927.8050504@eukrea.com> ("Eric =?iso-8859-1?Q?B=E9nard?=
	=?iso-8859-1?Q?=22's?= message of "Thu,
	13 Jan 2011 14:07:51 +0100")
Message-ID: <lyzkr49adq.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.6
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.71 on 62.153.82.30
Subject: Re: [PATCH 3/3] mtd-utils: add 1.4.1
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
X-List-Received-Date: Thu, 13 Jan 2011 14:10:44 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Eric B=E9nard <eric@eukrea.com> writes:

>> Is there a reason we're perpetuating lzo1 for newer stuff rather than
>> switching to lzo2?
>>
> lzo1 seems necessary :
> compr_lzo.c:29:19: fatal error: lzo1x.h: No such file or directory

mtd-utils build fine here after removing *all* the lzo1 related patches
and the do_configure_prepend().


Enrico


