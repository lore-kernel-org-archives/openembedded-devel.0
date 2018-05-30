Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot0-f182.google.com (mail-ot0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 44C4F74DA0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 23:32:51 +0000 (UTC)
Received: by mail-ot0-f182.google.com with SMTP id i5-v6so23232250otf.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 16:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=nukj+B6mZJAuwkK5brT2ph9G6zZQyjMbs8rzJygrzjE=;
	b=FoYukPg4fsPDbWlweG+C+86w2p1mcpdPDo4veEMH6+qAszxc+oR7orWokaLTe6aKsK
	rU0ELZgPetDHJoN2v0qhb2nG1ZPvyhXofwVAim10D574cajbzrUWI3XS8qLKMsbxWVz7
	l36Jgyi0BFxiBcmhw/koYg60kR0ScQFUF0NnLJKMv4Fizo7hUwYi7reqARGTLyZVkmdF
	45O5AnUB/pLsrh34lfVXlMmEll/hrQpSegDRl/y5N5qhYFsK3cEgX66vCW47MCMdYcTN
	iFwbd1ujTEQf5QPtF+kdT8eIxmnGWVXdDx3CdjJTXkr9Xv0T0IPwPuapnqGVs/8VE8Qe
	27Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=nukj+B6mZJAuwkK5brT2ph9G6zZQyjMbs8rzJygrzjE=;
	b=kEne1pGU/KhlZB78KWGkiXK6zH+thMssTk//fUjuNO6u0OGZVa0NQquR3RALzaXhEt
	CFxVD1jA5h6vDi7L/cLN2U4NsMWqudvusB472xqSSsepCRMTiHV/EzoQJ87h/NmX7UJ0
	OswthohoZMp9zWrH/7g+zMQf6uDOkW8uPmQkA3gINwmu0RD8TNmTW+YiA34BGwmIqtSh
	gXm7f89PsmMBLEcJTQs7HJTLHABOgCy2czWhiXCrI2S7YRu0wZzN3O1EyAKj13PWDmPv
	3gFsx4QwCXsXrJuuQFwnlBWstioKkMltgxCsBpO2+ezlIfrFOBqQF+Z8vIGfGlOlFix9
	mJAw==
X-Gm-Message-State: ALKqPwe0E5+EfabcZpbOfIr4oUaGLEPb35dx6N4pOsfr5bhVtFLVpHYU
	5weqgZ9CkhZOJ+4ooZfxx6j6Gh7BKDSw9m9UvU7G/A==
X-Google-Smtp-Source: ADUXVKK08zAQpwT6yw0Qgv+banpmDXWJCjMPBFsxkFMvG2ezL72orRUFWpWec3TywgFc5FCsIr3f9vxW8PUcvTLi5Z8=
X-Received: by 2002:a9d:3a65:: with SMTP id
	j92-v6mr3325169otc.352.1527723171754; 
	Wed, 30 May 2018 16:32:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:490b:0:0:0:0:0 with HTTP; Wed, 30 May 2018 16:32:51
	-0700 (PDT)
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 31 May 2018 01:32:51 +0200
Message-ID: <CALbNGRTZOo_EaPNuQWB0iV-OVUy-uwKgt-PGwBz3O=ROqMZBxQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Avoid version going backwards for beta versions
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
X-List-Received-Date: Wed, 30 May 2018 23:32:51 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

There was a pre-release for fluidsynth-2.0.0.beta and I expect the
release will be fluidsynth-2.0.0. How would I name the beta recipe to
avoid version going backwards with 2.0.0?

I know there was a thread where Martin gave hints how to achieve but I
can't find it - sigh.

Please help a forgetful old man :)

Andreas

