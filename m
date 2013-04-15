Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1URqb7-0000OW-OY
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 23:05:59 +0200
Received: by mail-qa0-f47.google.com with SMTP id bn16so943212qab.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 13:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:references:date:in-reply-to
	:message-id:user-agent:mime-version:content-type;
	bh=jX4I4bXwHJx2J8DIvAQRPU8dhZvDugDE+Het4iWlZCQ=;
	b=WUTnESjve4JR3IVVPbOyUULVaEvGCknmVL99QvCCrHWx4WVuCT/b/0STTGFya+pGzT
	ABWh+uQ5ljN2oeQh1Oio3yHxVefMWj5Iv1Ta5k7lENl+aseiowACObkEW0n97j6jsN3E
	u+ZrKv4EYQCejC3NrWg1DLD2chwz52JGj7BRrE6O9y7ffnLwDRChKTAfzYIKBrMR8YKw
	QqRaLHH3nIN7JjKUAUPSEOetkngfLFXWEJyYvEv830DMC/E4nqj2B1M3cmwDVnueIymp
	3VOjxZxP/v8xTw/uZIgB92DfiTUz+PBbpW50hKpibBQan5/uNZkiQnSPAlnvXzASEsjC
	+v7A==
X-Received: by 10.224.75.133 with SMTP id y5mr24131145qaj.78.1366058908242;
	Mon, 15 Apr 2013 13:48:28 -0700 (PDT)
Received: from cl-t066-141cl.privatedns.com.gmail.com (wkit.com.br.
	[67.205.85.241])
	by mx.google.com with ESMTPS id d4sm17202933qed.6.2013.04.15.13.48.26
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 13:48:27 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
References: <1365873301-29552-1-git-send-email-otavio@ossystems.com.br>
	<1365873301-29552-2-git-send-email-otavio@ossystems.com.br>
	<20130415143735.GF10628@jama.dyndns-home.com>
Date: Mon, 15 Apr 2013 16:48:00 -0400
In-Reply-To: <20130415143735.GF10628@jama.dyndns-home.com> (Martin Jansa's
	message of "Mon, 15 Apr 2013 16:37:35 +0200")
Message-ID: <854nf7plkv.fsf@cl-t066-141cl.privatedns.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>
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
X-List-Received-Date: Mon, 15 Apr 2013 21:06:02 -0000
Content-Type: text/plain

On Mon, 15 Apr 2013 16:37:35 +0200 Martin Jansa <martin.jansa@gmail.com> wrote:

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
>> +DEPENDS = "gdk-pixbuf libgsf gtk+3 libxml2 libglade libart-lgpl
>> intltool-native libgnomecanvas libgnomeprint libbonoboui
>> orbit2-native"
>> +DESCRIPTION = "Gnumeric spreadsheet for GNOME"
>> +
>> +GNOME_COMPRESS_TYPE = "xz"
>> +BPN="${PN}"
>
> Why is this needed ^? It shoudn't be there.

Thanks for catching that, Martin.  It's not needed, indeed.  I just
submited a new patch without that line.

Best wishes.
Mario


