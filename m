Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7BDFE6EFBE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 13:26:43 +0000 (UTC)
Received: by mail-yh0-f48.google.com with SMTP id z6so613630yhz.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 05:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=JLgPfa+G0WP90C7NduoDN2Dr0UCN68mFJD1jj7Gvif0=;
	b=yrTXHUxSYo64hyuwP0VjNlD4xPtrF+ytVbz4NC7vW1ZOnlbyir/KHwKTx9o5cLGJY0
	wEcTcXfFDq2sqCotw20MZ2qdq5KiW0TB0kLtXlsn9lZnyGMjG4U+OnB2OzWYMPs+KnJn
	HlQmGI+Qky8lbXq549TzBWL/qr8el1vEt8Unh1B+d3mX4q3xGb4SRsK/HAwh7Q/ScRUq
	Wc1rKqcW/kmNZQ66Qr733b9L3zq99rmVTvWOemX260X938SqRJ1wvhkZ75zxWeZUfvR1
	finYC/uayrLHy4lSpqz8c/TUv8xGpGQMQZ7i1/qrjnQ5xRsN2eE1DSBzufIHyRK7dRby
	zxYA==
MIME-Version: 1.0
X-Received: by 10.236.39.140 with SMTP id d12mr396623yhb.155.1393594004219;
	Fri, 28 Feb 2014 05:26:44 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Fri, 28 Feb 2014 05:26:44 -0800 (PST)
In-Reply-To: <1393580032-3910-1-git-send-email-jacob.kroon@mikrodidakt.se>
References: <1393580032-3910-1-git-send-email-jacob.kroon@mikrodidakt.se>
Date: Fri, 28 Feb 2014 10:26:44 -0300
X-Google-Sender-Auth: QaKYZl50WmImU4CIi8vCyUETsCI
Message-ID: <CAP9ODKooPNfAAF2Z_t4jSmpjt4+zUHVcGvyzeU6NHFNKf6m9GQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v2] Explicitly disable Debian-style package renaming for nativesdk-qtbase-tools
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Feb 2014 13:26:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 28, 2014 at 6:33 AM, Jacob Kroon <jacob.kroon@mikrodidakt.se> wrote:
> Since commit 8da5017712a7ddcb8488e095b9aa03b0273f23e9, libQt5*.so files
> are included in the nativesdk-qtbase-tools package. However, this together
> with the fact that the binaries are placed in a subdir "qt5" of bin will
> confuse the Debian-style package renaming logic in debian.bbclass, causing the
> resulting ipk package to be created as "nativesdk-libqt5core5".
>
> Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>

Please rework the commitlog as:

nativesdk-qtbase-tools: disable Debian-style package renaming

Since commit 8da5017712a7ddcb8488e095b9aa03b0273f23e9, libQt5*.so files
are included in the nativesdk-qtbase-tools package. However, this together
with the fact that the binaries are placed in a subdir "qt5" of bin will
confuse the Debian-style package renaming logic in debian.bbclass, causing the
resulting ipk package to be created as "nativesdk-libqt5core5".

Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>

and please add my Acked-by.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

