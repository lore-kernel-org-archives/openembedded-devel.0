Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1P8FfD-0008P0-KV
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 19:07:52 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id o9JH73Nd013649
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 19:07:05 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.72) (envelope-from <ensc@sigma-chemnitz.de>) id 1P8Fev-00081N-DM
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 19:07:33 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <1287420263-28528-1-git-send-email-msmith@cbnco.com>
	<lypqv6492b.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<AANLkTikkRYEJUGrR5VYDwS7Yb6fW-aqfF_Ta1gh5sA8c@mail.gmail.com>
Date: Tue, 19 Oct 2010 19:07:33 +0200
In-Reply-To: <AANLkTikkRYEJUGrR5VYDwS7Yb6fW-aqfF_Ta1gh5sA8c@mail.gmail.com>
	(Frans Meulenbroeks's message of "Tue, 19 Oct 2010 15:25:40 +0200")
Message-ID: <lylj5u3ycq.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.68 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v3] package.bbclass: copy dotfiles in root D to PKGD
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
X-List-Received-Date: Tue, 19 Oct 2010 17:07:52 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Frans Meulenbroeks <fransmeulenbroeks@gmail.com> writes:

>>> + =A0 =A0 os.system('rm -rf %s/*' % (pkgcopy))
>>
>> Can be written as
>>
>> =A0os.system('rm -rf %s' % (pkgcopy))
>> ...
>>> + =A0 =A0 os.system('cp -pPR %s/. %s/' % (installdest, pkgcopy))
>>
>
> No this is not good. The rm command you give will also remove the dir.

Why is this bad?  The dir is recreated by the 'cp'.


> The cp command will copy %s/.

Only the final permissions of <dstdir> may differ between

  rm -rf <dstdir>
  cp -pPR <srcdir>/. <dstdir>/

and

  rm -rf <dstdir>
  mkdir <dstdir>
  cp -pPR <srcdir>/. <dstdir>/


In first case, <dstdir> gets permissions of <srcdir>. In the second it
keeps the permissions from <dstdir>.

Else, content (both the files and their attributes) of <dstdir> will be
the same for both operations.


Enrico


