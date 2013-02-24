Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U9WxU-0006J7-Bi
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Feb 2013 09:29:21 +0100
Received: by mail-pb0-f52.google.com with SMTP id ma3so1149785pbc.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Feb 2013 00:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=cLLMHZTAy6uDtlKSWyOfXa8oEHMOKxadJaeARfeYR1A=;
	b=T9TXGhx2kOdPdW+FLlN1eAUYnZ1nyCYG6DpBsia+p1hcReB4Ki2whzxJiDPcudSz7X
	KJ2gVU5xlNWZAXgKOZoeIOgyFAgykNi9oYZrsNawnD0lVu6XqSVsJ7c4Ijv/yKgA4BzG
	U/7hM5/5d+jYq5ryU9TYKFTCPyqDUxoQzZ+2zYQDWHec3PxqwietbuVb6z82njJzyp+o
	vFRVdueI4XMThmVR6b5JC8QzrMO0s9isMOkxHpnU+iXFXSN8+6aqqrc/YeZjMlXTacnd
	e23cYfjOVgHHLu3r/25Ad2HbNUwhXgzhCM+FRQVSP6yQIkev3UpDMQa3aYLd6D3a3fi6
	CkZQ==
X-Received: by 10.66.88.198 with SMTP id bi6mr12818462pab.54.1361693583697;
	Sun, 24 Feb 2013 00:13:03 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id ol7sm8583206pbb.14.2013.02.24.00.13.02
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 24 Feb 2013 00:13:03 -0800 (PST)
Date: Sun, 24 Feb 2013 00:12:59 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130224081258.GD3154@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <20130218094145.29630.63354@hoothoot>
	<CAPESJy7YAk9vj56pPkATdJO95xv8gwysyRyA9vyEq5YX-MyD=Q@mail.gmail.com>
	<20130218142026.7849.12017@hoothoot>
	<CAPESJy5Rox_qo+g6T1j0dT0uZ_ZaUyHmZSk8hdwZZDRSh0=UzA@mail.gmail.com>
	<20130218165351.14989.14162@hoothoot>
	<CAF6bG8dwjBY-bQnb8oBRXFZqoK9NzA+T2RGd+=qe0ffZhgKkRA@mail.gmail.com>
	<20130218185446.19879.81595@hoothoot>
	<CALbNGRRMEer3+UQN4OsO5zm7tsv7U+BQRH8wHY8yYNVKVw_mHg@mail.gmail.com>
	<20130219104653.30650.95226@hoothoot>
MIME-Version: 1.0
In-Reply-To: <20130219104653.30650.95226@hoothoot>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Sun, 24 Feb 2013 08:29:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (19/02/13 11:46), Johannes Schauer wrote:
> Hi,
> 
> Quoting Andreas Müller (2013-02-18 21:15:43)
> > FWIW long time ago in meta-oe commit 5b8522e3b592c96ec9325aff4bbaa68972e52d5b
> > gvfs-gdu-volume-monitor was spitted out into an own recipe to break
> > dependency loop for gvfs.
> 
> If I read this correctly, then this means that for some software packages,
> multiple bitbake recipes exist for the purpose of breaking dependency cycles?
> 
> How does the generation of build order work? Which algorithm handles the
> selection of recipes such that build dependency cycles are avoided? And once a
> recipe which was used to break a dependency cycle was compiled, how is the
> recompilation of the *full* package scheduled?

bitbake handles the built dependencies and runqueue generation which
decided the order or task execution. You should read about bitbkake
internals if you are interested in internal functioning of dep
resolution in bitbake.


