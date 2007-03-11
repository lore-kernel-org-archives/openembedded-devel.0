Received: from [64.233.162.227] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HQTnW-0001Qw-VY
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Mar 2007 20:33:39 +0100
Received: by nz-out-0506.google.com with SMTP id m22so830301nzf
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Mar 2007 12:33:38 -0700 (PDT)
Received: by 10.35.121.9 with SMTP id y9mr9672131pym.1173641617219;
	Sun, 11 Mar 2007 12:33:37 -0700 (PDT)
Received: from cube ( [82.193.98.7])
	by mx.google.com with ESMTP id 36sm7100598nza.2007.03.11.12.33.34;
	Sun, 11 Mar 2007 12:33:36 -0700 (PDT)
Date: Sun, 11 Mar 2007 21:33:32 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <665468377.20070311213332@gmail.com>
To: "Jan Janssens" <janjans321@gmail.com>
In-Reply-To: <7c8eac300703110856v1e825559x8f89abd79d17fed8@mail.gmail.com>
References: <274295013.20070311040657@gmail.com>
	<7c8eac300703110856v1e825559x8f89abd79d17fed8@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Sun, 11 Mar 2007 19:33:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Jan,

Sunday, March 11, 2007, 5:56:28 PM, you wrote:

>> I finally took time to clean it up and make list configurable via OE
>> variable, and submit it: http://bugs.openembedded.org/show_bug.cgi?id=1966
> Cool!

>> GLIBC_GENERATE_LOCALES = "en_GB,UTF-8 de_DE,UTF-8"
>>
>>  Format is <locale>,<encoding> pairs separated by space. Format is
>> actually based on "SUPPORTED" file generated/provided with GLIBC. For
>> development purposes, encoding can be just "UTF-8", and for Angstrom,
>> only en_GB locales is required now. Previous default from OZ/Familiar
>> was "en_GB,UTF-8 de_DE,UTF-8 fr_FR,UTF-8".

> Any special reason to use a comma between the locale and the encoding,
> instead of a dot? Not only does the list (at first glance) now look
> comma-seperated, almost everywhere a '.' (dot) is used to glue the
> encoding to the locale...

  My intention was to do as little (pre/post)processing/interpretation
for GLIBC's SUPPORTED file as possible. Looking at what it has:

aa_DJ.UTF-8 UTF-8
aa_DJ ISO-8859-1

  It's clear why dot couldn't be used - it already appears in
SUPPORT's syntax. So, again, I don't try to interpret it in any way,
just provide means to specify expressions of that syntax using OE variable,
using simple substitution of newlines with spaces, and spaces with
commas.

  Colon or semicolon would be other obvious choices.

> Maybe we could even take this one step further and use IMAGE_LINGUAS
> and introduce an IMAGE_ENCODINGS and combine these together to get a
> list of binary locales to generate?

  Yes, that would be natural extension of that idea. But my patch
doesn't go that far, just offering way to constrain *GLIBC*'s locate
generation.

> Jan.



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



