Return-Path: <alex.kiernan@gmail.com>
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
	[209.85.166.178])
	by mail.openembedded.org (Postfix) with ESMTP id 146366D458
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Dec 2019 06:53:12 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id t9so1104371iln.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2019 22:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=6AJjRtKJXQVMEda6bviRHondYup5OtGjGGrwn55L6Ps=;
	b=Z0LEuXmsPsPGtiZCau5igOSCukka5bZFbexJP0KIAgMezV25mBA0aHlgxakUTLlHgP
	QNYuklXaDFgGNk14mbr9RijHNmq3KLiSjU9F4PEu5IlXzriSj0z8PSO4loISUzFwmG4L
	emk0SQH/+ootHyPy/hfcl/j3BEwJIMppyb9Ch6fF1ZrsS8u7gFSX+lDidl8JA1eFxULV
	Z7xG0uZvAxoNuwkzPVzcNIsvXnlI2mAMdkWqrvhKnnloON8756pKgBeHED/+Kt+utGe4
	CtsHhUh7K3i2SJsroXqLDTj2m5PTkzJxmSULT3LaJ1bZA74uUL/XM+fAuTtIc2/QVSlE
	Vm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=6AJjRtKJXQVMEda6bviRHondYup5OtGjGGrwn55L6Ps=;
	b=Xe2NiugA9eg3Ms6ehFYbyjrvKZBW0/4iRBSdQQJWAfJrXE7j8Pz4tS8cEmJjWbBJVy
	FzQOLktVZBqgkNxx1Se0oPK8SjpeIvTIcwmmEc68Nxd5XGJiRQv0kyG+ZHBlZXpDhKDa
	XMGbGsXRUilWW8rrO8ju5FUuiJs9VFUM4exCHe9KNxoA1ahsPMLSH4lrYfls201COV4i
	6ERtbma30GTvJc8cr93JlNedV7SMhgjRATaBwjAwKhKxupKtoNYgxiJNJ58TJ++P0ynW
	6vHrrlTjQvwKZBkuMFCboInHhGToVz5jpq42XdobJ/X1dEFnSKmNkRD1uuENfYHRYJm9
	jxsg==
X-Gm-Message-State: APjAAAXKyXjvxiy1RTrIJDLZTh2o7Z/AdTFiTWQxUy6ekS0aZ+WTQt4L
	bfwHrcgCzSWNSoNpFk051QF4pp5Lav4otelQ4k4/Pw==
X-Google-Smtp-Source: APXvYqx08+YiUP1rnvByZRs0H5ZcyfyYUDb3F+az11OnSgKLQ8D1vM8cbL7mf69biE3mVEjSScvj/8dwYrrsZ1wJTJA=
X-Received: by 2002:a92:1a0a:: with SMTP id a10mr6952538ila.295.1576133593695; 
	Wed, 11 Dec 2019 22:53:13 -0800 (PST)
MIME-Version: 1.0
References: <CAO5Uq5TEZH_VTN9EpWTDjhqMCgkVEGRB2bi5oXpCXamFMEkv+Q@mail.gmail.com>
In-Reply-To: <CAO5Uq5TEZH_VTN9EpWTDjhqMCgkVEGRB2bi5oXpCXamFMEkv+Q@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 12 Dec 2019 06:53:02 +0000
Message-ID: <CAO5Uq5S+pDYrdYbtFxMXY3jvHZn25aLDPip7O-ghzqv9=Bd+sA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Build looping with "Checking sstate mirror object availability...done"?
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
X-List-Received-Date: Thu, 12 Dec 2019 06:53:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 11, 2019 at 5:31 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> Our local master jenkins build looks like it's started looping with:
>
> 00:56:28.368  Checking sstate mirror object availability...done.
> 00:56:28.368  Checking sstate mirror object availability...done.
> 00:56:28.368  Checking sstate mirror object availability...done.
> 00:56:28.752  Checking sstate mirror object availability...done.
> 00:56:28.752  Checking sstate mirror object availability...done.
> 00:56:29.136  Checking sstate mirror object availability...done.
> 00:56:29.136  Checking sstate mirror object availability...done.
> 00:56:29.136  Checking sstate mirror object availability...done.
> 00:56:29.520  Checking sstate mirror object availability...done.
> 00:56:29.520  Checking sstate mirror object availability...done.
> 00:56:29.904  Checking sstate mirror object availability...done.
> 00:56:29.904  Checking sstate mirror object availability...done.
> 00:56:29.904  Checking sstate mirror object availability...done.
> 00:56:30.288  Checking sstate mirror object availability...done.
> 00:56:30.288  Checking sstate mirror object availability...done.
>
> The only changes from it's previous build are these two:
>
> Layers Update: poky
> * poky 9d606cf...f48ef0b (2):
>  > build-appliance-image: Update to master head revision
>  > sstate: Ensure SSTATE_PKG is reloaded when handling siginfo
>
> Its sstate-cache is on NFS (well AWS EFS) if that's relevant?
>
> At the point I killed it, it was just over an hour in, but was only a
> 100 tasks into the 7392 - a full rebuild is normally ~3.5 hours, but
> this didn't seem to really be making any meaningful progress.
>

Just to fill this back in, it completed after ~8 hours, looks like it
was something like a mass read/modify/write (which over NFS I'm not
surprised was awful) and we're now back where we were in terms of
build times.

-- 
Alex Kiernan

