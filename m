Received: from mail-oa0-f45.google.com ([209.85.219.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Uc11F-0002YI-Tc
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 May 2013 00:15:02 +0200
Received: by mail-oa0-f45.google.com with SMTP id j6so7266617oag.32
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 May 2013 14:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=IkCPThujWtDcUrwh6ZCAXx9v099XMtY/dVxlJ/RluW0=;
	b=yzCeItA4glTz/hPmw+OOYFui+IcwT8MTMjtpX1uyDLr+TEvs8NCBI3P5SkuF/HsTJQ
	vnF5hWNCGeD6MOoJbhusQ8B8rQ+PF2TLkR7effBO3sRxAslDsfhA5RfOHI+Ci99N1laI
	XK/7lVSNxGgUmdVsa6zElPY8mxGlS9OcSNdnrFLnLV/Ml3CD7nz9MilZkxx4AJsKALeT
	TDXzwvd4JHJqnCeHJJqejLOyOOU2zA0fmeJmVvzp9BNYIbHdVuPT095DJ+NPX0pTAA1t
	6ay9hEdBQ+tECyZWh2xZ8s1nvjRYifuUPZ9q3rt6HUK4qsfX+lNXfpbAEAikZvgZaCLo
	tC8g==
MIME-Version: 1.0
X-Received: by 10.60.116.3 with SMTP id js3mr12326548oeb.142.1368482206999;
	Mon, 13 May 2013 14:56:46 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Mon, 13 May 2013 14:56:46 -0700 (PDT)
In-Reply-To: <20130513215201.GF3187@jama>
References: <1368481622-5465-1-git-send-email-otavio@ossystems.com.br>
	<20130513215201.GF3187@jama>
Date: Mon, 13 May 2013 18:56:46 -0300
X-Google-Sender-Auth: SdySXVX8Qi_MxoG2GgTZGEKSRDo
Message-ID: <CAP9ODKpXcX5H6ndoz9ikz+0cUE9RPC7AvvAt8iKD+vHnoqXyqQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe PATCH] bigbuckbunny: Add 480p, 720p and 1080p movies
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
X-List-Received-Date: Mon, 13 May 2013 22:15:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 13, 2013 at 6:52 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, May 13, 2013 at 06:47:02PM -0300, Otavio Salvador wrote:
>> This provides a recipe to install the movies in the rootfs; these
>> allow for people to make demo images which carry the movies for show.
>>
>> These recipes are based on Angstrom ones. Thanks by their base work.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>  .../recipes-support/bigbuckbunny/bigbuckbunny-1080p.bb   | 16 ++++++++++++++++
>>  .../recipes-support/bigbuckbunny/bigbuckbunny-480p.bb    | 16 ++++++++++++++++
>>  .../recipes-support/bigbuckbunny/bigbuckbunny-720p.bb    | 16 ++++++++++++++++
>>  3 files changed, 48 insertions(+)
>>  create mode 100644 meta-oe/recipes-support/bigbuckbunny/bigbuckbunny-1080p.bb
>>  create mode 100644 meta-oe/recipes-support/bigbuckbunny/bigbuckbunny-480p.bb
>>  create mode 100644 meta-oe/recipes-support/bigbuckbunny/bigbuckbunny-720p.bb
>
> meta-multimedia?

I pondered about it but I think it is of generic use. I don't think we
need to have meta-multimedia to be able to use it.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


