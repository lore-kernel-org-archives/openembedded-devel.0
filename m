Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id BAB8A76009
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2018 19:24:19 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id u4-v6so1273006iof.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2018 12:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=wU/oVQlI7j8l+9nGnIZUCzUxznamMlS+Yn7jgwUe22k=;
	b=hmlDNZl4RwCojeyd6NkMjKEKgzezdP0VG/ImDbfLnoIkpJQj97WFTl/vGPu2uVdotP
	SsVyGUSrjWt+GJW7cVyowllI7ww4t2k1gpPjXSiucgcKRiRvAOOciioD63FvFdEfgHAQ
	5+rwoUWfylWL7uzYfUnD0ULnG0SsX4XOwTEoSVe9xsHBMi0otQhoIE1o7ZlQjJ5TdDnH
	gxkdAG5QKMJqwgFzNUdL5wtI0tEBEkyUMEMf9K4zk+KvzkUFiiBuypcwe0s8HAcY9bF3
	7H/fJ2YM8nj69NYZNX4r+pAW02ObwjBqCbIitvvaK0L/XL8tH9eG+LZnCeLHNFKDD6W3
	A9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=wU/oVQlI7j8l+9nGnIZUCzUxznamMlS+Yn7jgwUe22k=;
	b=mF4pp9OgBjzuproSUcSiDJCfZhk0kzKHD/CVJFVaj3O9qI1XEcja9AF2uZ/Wp98Meh
	6BctlnIYH2DLwjBU3pDLMN/3bsEANBXWy0g1Olqc1L3zpTMVsX51CrH40e+3NC0QCzms
	X5pcMTs4DefTPzXZlenGs0WkhBt0wCoOAuSgddArjlEPzZo3ECvn7fLgpIrjh3ADYWr8
	rerYy/e+f/YBU2cGr0rOuC2TL4AwzdG0njteggsuhf/MAi2kVRumvbP2ls/6YAG/i+Lc
	4eiV5gKhV03u0gOCMjxIHuqMwNTe1BVX7oz28mJDVaIBy3qR4kD0wxT+2f8z/RR1Eaeo
	S8Cg==
X-Gm-Message-State: APt69E2OxS7bwrNedrs07gumLMXw6t2TycfYzjGnvQ3rX17umjRUZ2s1
	HZKdkEHm6MpDPu4r9BZfpyaGasQLbbb8BzsxXPAbgA==
X-Google-Smtp-Source: ADUXVKLZ0uYWlzeQm0xsunZPUnNFcOfVfhxFpewCAEzk7u4Q20sljbXrsGUW5qeGH24NK6o9M3pGLYHT0rJ3BrJTGG4=
X-Received: by 2002:a6b:1746:: with SMTP id
	67-v6mr15904168iox.292.1529436260255; 
	Tue, 19 Jun 2018 12:24:20 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
Date: Tue, 19 Jun 2018 15:24:08 -0400
Message-ID: <CAE=T-s66aNwCjWwWfMkZNrw+sUAak3Hg=T2SCjSeNkX8vu_w7g@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: meta-python/python-scipy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jun 2018 19:24:19 -0000
Content-Type: text/plain; charset="UTF-8"

Has anyone been able to have some sort of a breakthrough to build
python-scipy?

I'm trying to build python-scipy on a x86-64generic MACHINE and I reached
math-atlas fun...

I couldn't find any math-atlas recipe... at this point I think it might be
a lot easier to build an ISO with a preseed configuration that installs
python-scipy for our purpose.

Has anyone worked on it and would share they work on the contrib repo?

Thanks.
Max.
-- 
Max

