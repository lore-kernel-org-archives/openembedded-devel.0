Received: from [209.85.128.189] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philipp.zabel@gmail.com>) id 1IipSA-0002QW-GQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Oct 2007 12:51:44 +0200
Received: by fk-out-0910.google.com with SMTP id 18so471280fks
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Oct 2007 03:44:56 -0700 (PDT)
Received: by 10.82.112.3 with SMTP id k3mr3134088buc.1192784360447;
	Fri, 19 Oct 2007 01:59:20 -0700 (PDT)
Received: by 10.82.118.8 with HTTP; Fri, 19 Oct 2007 01:59:20 -0700 (PDT)
Message-ID: <74d0deb30710190159i6220af0dna5ba0efe949c8402@mail.gmail.com>
Date: Fri, 19 Oct 2007 10:59:20 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1IimaA-0007xc-Ba@linuxtogo.org>
MIME-Version: 1.0
References: <E1IimaA-0007xc-Ba@linuxtogo.org>
Subject: Re: [oe-commits] org.oe.dev telepathy: add telepathy-python 0.14.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Oct 2007 10:51:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/19/07, pH5 commit <openembedded-commits@lists.openembedded.org> wrote:
> telepathy: add telepathy-python 0.14.0

Hm, I wonder whether this should be renamed to python-telepathy for
consistency with other python bindings (and the same for dbus-python
-> python-dbus) like Debian does.

> Author: pH5@openembedded.org
> Branch: org.openembedded.dev
> Revision: 320cf2f1a4279be26084f178c252be667db6c6b4
> ViewMTN: http://monotone.openembedded.org/revision/info/320cf2f1a4279be26084f178c252be667db6c6b4
> Files:
> 1
> packages/telepathy/telepathy-python_0.14.0.bb
> Diffs:
>
> #
> # mt diff -r466773a42b2f042df1c0582c6315dd2901312eed -r320cf2f1a4279be26084f178c252be667db6c6b4
> #
> #
> #
> # add_file "packages/telepathy/telepathy-python_0.14.0.bb"
> #  content [b72e5e36875b783b40a06c426e30d901358c86a7]
> #
> ============================================================
> --- packages/telepathy/telepathy-python_0.14.0.bb       b72e5e36875b783b40a06c426e30d901358c86a7
> +++ packages/telepathy/telepathy-python_0.14.0.bb       b72e5e36875b783b40a06c426e30d901358c86a7
> @@ -0,0 +1,8 @@
> +DESCRIPTION = "Telepathy framework - Python package"
> +HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
> +LICENSE = "LGPL"
> +RDEPENDS_${PN} += "dbus-python"
> +
> +SRC_URI = "http://telepathy.freedesktop.org/releases/${PN}/${P}.tar.gz "
> +
> +inherit distutils
>
>
>
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>


