Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <robert@erafx.com>) id 1Q7zWu-00034Q-J6
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Apr 2011 02:26:28 +0200
Received: by vxd7 with SMTP id 7so2668775vxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Apr 2011 17:24:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.88.137 with SMTP id bg9mr2232317vdb.123.1302221274655; Thu,
	07 Apr 2011 17:07:54 -0700 (PDT)
Received: by 10.220.192.1 with HTTP; Thu, 7 Apr 2011 17:07:54 -0700 (PDT)
X-Originating-IP: [24.165.208.114]
In-Reply-To: <BANLkTimXZfFJORrAqT9JO1hHVGWenjAfAA@mail.gmail.com>
References: <BANLkTimXZfFJORrAqT9JO1hHVGWenjAfAA@mail.gmail.com>
Date: Thu, 7 Apr 2011 20:07:54 -0400
Message-ID: <BANLkTimdVLseS5y=VvMmZoy5F62S4y4TwA@mail.gmail.com>
From: Robert Foerster <robert@erafx.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: How do I install python modules for use within recipes?
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
X-List-Received-Date: Fri, 08 Apr 2011 00:26:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Apr 7, 2011 at 7:51 PM, Charles Manning <cdhmanning@gmail.com>wrote:

> Hi
>
> I have a project which uses python as part of the building process to
> generate some C code from some XML which is then later compiled.
>
> The python script uses the python lxml module.
>
> My recipe has a do_compile as follows:
>
> do_compile() {
>        cd ${S}/
>        make -f Gencode.mk
>        make
> }
>
> During the make -f Gencode.mk, the python script which imports lxml
> fails to do so and fails.
>
> Question: How do I instruct OE to set up the lxml module and make it
> available here?
>
>
I don't see a recipe for python-lxml-native, so you'll likely have to make
one (and then make your recipe depend on it to ensure it's built and
available).

There are several other python-*-native modules in OE, take a look at what
they're doing.
http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/python




> Thanks
>
> Charles
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

