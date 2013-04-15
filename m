Received: from mail-oa0-f54.google.com ([209.85.219.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1URku9-0004gi-9H
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 17:01:25 +0200
Received: by mail-oa0-f54.google.com with SMTP id l20so21335oag.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 07:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=+cx4XSttoFfzkAR35CRGFoQaOE2/emhwXHKKYjT6tc8=;
	b=vF3Md4PBs/nONYKWednWinLh1LUOPwTDML9W5TfDs/ZEuHuyYbDAIH+F9Th2m2lAIO
	RwG9cSUTktOZ99G5xuiVpDdfymWt1IlbFpEjQEqVeVQ9q6kScEh4hlZz5lVWAzMtdyYy
	ivPZC/x63IRNTny1mo+OszVWefUpsHi0Sn2zhl28atMILpFliJd4fnlCU4tA4xO5bmiR
	cxWsaZh+kWOrSfaaig7evviPDsN+LqfNLb2LKZbcDvOTgSc7kSBRh2Y9R6F9zGcFJPqF
	jM9xwzicIAq0r8FytpYW8C/r94fbUEkq4s+gbG2mvhSeOXei8fWhfJOofxNmwMGuhIT1
	YtOw==
MIME-Version: 1.0
X-Received: by 10.60.37.36 with SMTP id v4mr6937225oej.53.1366037023831; Mon,
	15 Apr 2013 07:43:43 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.129.129 with HTTP; Mon, 15 Apr 2013 07:43:43 -0700 (PDT)
In-Reply-To: <20130415143735.GF10628@jama.dyndns-home.com>
References: <1365873301-29552-1-git-send-email-otavio@ossystems.com.br>
	<1365873301-29552-2-git-send-email-otavio@ossystems.com.br>
	<20130415143735.GF10628@jama.dyndns-home.com>
Date: Mon, 15 Apr 2013 11:43:43 -0300
X-Google-Sender-Auth: JlDOxzoPdSQe6n-vqNzOu4zEbFc
Message-ID: <CAP9ODKq1kHqK8ywhOx_pkR_iidbkXo6kkgXMLqohwa+kBHv32Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: [meta-oe PATCH 2/2] gnumeric: add recipe for version 1.12.0
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
X-List-Received-Date: Mon, 15 Apr 2013 15:01:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Apr 15, 2013 at 11:37 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sat, Apr 13, 2013 at 02:15:01PM -0300, Otavio Salvador wrote:
>> From: Mario Domenech Goulart <mario@ossystems.com.br>
>>
>> Based on the OE classic recipe as of
>> bd204492e0ed296bbac2999da29f831cbdf965f9
>>
>> Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>  .../recipes-gnome/gnumeric/gnumeric_1.12.0.bb      | 44 ++++++++++++++++++++++
>>  1 file changed, 44 insertions(+)
>>  create mode 100644 meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
>>
>> diff --git a/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb b/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
>> new file mode 100644
>> index 0000000..cd42e18
>> --- /dev/null
>> +++ b/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
>> @@ -0,0 +1,44 @@
>> +LICENSE = "GPLv2 | GPLv3"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=be0de417af78dd340558810d1ced52e6"
>> +SECTION = "x11/utils"
>> +S = "${WORKDIR}/gnumeric-${PV}"
>> +DEPENDS = "gdk-pixbuf libgsf gtk+3 libxml2 libglade libart-lgpl intltool-native libgnomecanvas libgnomeprint libbonoboui orbit2-native"
>> +DESCRIPTION = "Gnumeric spreadsheet for GNOME"
>> +
>> +GNOME_COMPRESS_TYPE = "xz"
>> +BPN="${PN}"
>
> Why is this needed ^? It shoudn't be there.

I think it can be dropped; it came from original recipes which Mario
used as reference, I think.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


