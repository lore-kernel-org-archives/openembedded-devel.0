Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Rfx1K-0001j1-BZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Dec 2011 18:10:30 +0100
Received: by qabg14 with SMTP id g14so8727906qab.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2011 09:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=Oy9mnKKKE1R2h5x/fvoAqzYMKUxJWCACctn3vzhV5SM=;
	b=HSkxuosCFsPsnQYVo4lOb5zz2hw4+TfkKGJKskhDnBLSXWPT4qFPSUFeYgL43e0Pqz
	wyLCzXsDllFp6CkkJHFgY91ag8cXpnxOSEb/4gtKIgqYEIWL04GciLPiV/jHgQ2Ku/OQ
	omYMBccSxUxfCwpR6fZgiA3qYcbzSugcPvEy0=
Received: by 10.224.200.197 with SMTP id ex5mr38468626qab.88.1325091793313;
	Wed, 28 Dec 2011 09:03:13 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.187.141 with HTTP; Wed, 28 Dec 2011 09:02:51 -0800 (PST)
In-Reply-To: <CAOHjBZtAzdpynVMt6m=ofp6P+Xy9i7=NXaBU2mgT-4uR8MXf4Q@mail.gmail.com>
References: <CAOHjBZuETnOuVQkfC9hmoS9X8vRVQCnLUPtqF6g5+JLjT4+DQA@mail.gmail.com>
	<1535311.D6ZbQ8u8yE@helios>
	<CAOHjBZtAzdpynVMt6m=ofp6P+Xy9i7=NXaBU2mgT-4uR8MXf4Q@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 28 Dec 2011 10:02:51 -0700
X-Google-Sender-Auth: F1hrcQuN51vn2wbEyQLZmvmclW4
Message-ID: <CABcZAN=AUfM00EX6Z756k835ppCX1ASmCZb3jot04i2-SEEuGw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Python2.7.2 compatibility
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
X-List-Received-Date: Wed, 28 Dec 2011 17:10:30 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 28, 2011 at 9:57 AM, Giuseppe Condorelli
<giuseppe.condorelli@gmail.com> wrote:
> ERROR: There is a comment on line 24 of file
> /home/condorg/work/openembedded/recipes/ekiga/ekiga_git.bb (#
> --enable-static-libs \) which is in the middle of a multiline expression.
> Bitbake used to ignore these but no longer does so, please fix your
> metadata as errors are likely as a result of this change.

Did you not actually read the error message? It's bitbake erroring
out, and right here it's explaining why, and that it's an issue with
this metadata with the new bitbake. Fix the metadata, or use an older
bitbake.
-- 
Christopher Larson


