Received: from [66.249.92.171] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <janjans321@gmail.com>) id 1HQQPO-0000km-Ma
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Mar 2007 16:56:30 +0100
Received: by ug-out-1314.google.com with SMTP id e2so2015699ugf
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Mar 2007 08:56:30 -0700 (PDT)
Received: by 10.114.169.2 with SMTP id r2mr891806wae.1173628588540;
	Sun, 11 Mar 2007 08:56:28 -0700 (PDT)
Received: by 10.115.74.19 with HTTP; Sun, 11 Mar 2007 08:56:28 -0700 (PDT)
Message-ID: <7c8eac300703110856v1e825559x8f89abd79d17fed8@mail.gmail.com>
Date: Sun, 11 Mar 2007 16:56:28 +0100
From: "Jan Janssens" <janjans321@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <274295013.20070311040657@gmail.com>
MIME-Version: 1.0
References: <274295013.20070311040657@gmail.com>
Subject: Re: [RFC] Allow to limit generated binary locales to predefined list
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
X-List-Received-Date: Sun, 11 Mar 2007 15:56:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> I finally took time to clean it up and make list configurable via OE
> variable, and submit it: http://bugs.openembedded.org/show_bug.cgi?id=1966
Cool!

> GLIBC_GENERATE_LOCALES = "en_GB,UTF-8 de_DE,UTF-8"
>
>  Format is <locale>,<encoding> pairs separated by space. Format is
> actually based on "SUPPORTED" file generated/provided with GLIBC. For
> development purposes, encoding can be just "UTF-8", and for Angstrom,
> only en_GB locales is required now. Previous default from OZ/Familiar
> was "en_GB,UTF-8 de_DE,UTF-8 fr_FR,UTF-8".
Any special reason to use a comma between the locale and the encoding,
instead of a dot? Not only does the list (at first glance) now look
comma-seperated, almost everywhere a '.' (dot) is used to glue the
encoding to the locale...

Maybe we could even take this one step further and use IMAGE_LINGUAS
and introduce an IMAGE_ENCODINGS and combine these together to get a
list of binary locales to generate?

Jan.


