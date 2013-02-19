Received: from mout.web.de ([212.227.15.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <j.schauer@email.de>) id 1U7kyV-0005Ic-HL
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Feb 2013 12:03:04 +0100
Received: from localhost ([212.201.44.247]) by smtp.web.de (mrweb001) with
	ESMTPSA (Nemesis) id 0MINMF-1UAE5q3hZ1-004BRv for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2013 11:46:53 +0100
MIME-Version: 1.0
From: Johannes Schauer <j.schauer@email.de>
User-Agent: alot/0.3.3+
To: openembedded-devel@lists.openembedded.org
References: <20130218094145.29630.63354@hoothoot>
	<CAPESJy7YAk9vj56pPkATdJO95xv8gwysyRyA9vyEq5YX-MyD=Q@mail.gmail.com>
	<20130218142026.7849.12017@hoothoot>
	<CAPESJy5Rox_qo+g6T1j0dT0uZ_ZaUyHmZSk8hdwZZDRSh0=UzA@mail.gmail.com>
	<20130218165351.14989.14162@hoothoot>
	<CAF6bG8dwjBY-bQnb8oBRXFZqoK9NzA+T2RGd+=qe0ffZhgKkRA@mail.gmail.com>
	<20130218185446.19879.81595@hoothoot>
	<CALbNGRRMEer3+UQN4OsO5zm7tsv7U+BQRH8wHY8yYNVKVw_mHg@mail.gmail.com>
In-Reply-To: <CALbNGRRMEer3+UQN4OsO5zm7tsv7U+BQRH8wHY8yYNVKVw_mHg@mail.gmail.com>
Message-ID: <20130219104653.30650.95226@hoothoot>
Date: Tue, 19 Feb 2013 11:46:53 +0100
X-Provags-ID: V02:K0:eVIqfeaE4dnf8FsEjPsMsUcq0e4KGytku07cVuukt4m
	YderBbBk73JjPapQnIYuDmx4nUe0c/2vsk7pkZxe5jFWej2Ooa
	r0URlTST23B7SrNaHDlUcYScASSwv1JtxRWbEP+CDvyF7rcu8w
	9MQL9rxvp/su4ReQWJnJjlMdjdi+e1qXqq/64cPcxmK2IdQaUy
	NYkbPbi/Bf8caXOVseBQw==
Subject: Re: build dependency cycles in openembedded
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
X-List-Received-Date: Tue, 19 Feb 2013 11:03:04 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Quoting Andreas M=C3=BCller (2013-02-18 21:15:43)
> FWIW long time ago in meta-oe commit 5b8522e3b592c96ec9325aff4bbaa68972e5=
2d5b
> gvfs-gdu-volume-monitor was spitted out into an own recipe to break
> dependency loop for gvfs.

If I read this correctly, then this means that for some software packages,
multiple bitbake recipes exist for the purpose of breaking dependency cycle=
s?

How does the generation of build order work? Which algorithm handles the
selection of recipes such that build dependency cycles are avoided? And onc=
e a
recipe which was used to break a dependency cycle was compiled, how is the
recompilation of the *full* package scheduled?

cheers, josch


