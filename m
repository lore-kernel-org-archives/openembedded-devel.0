Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1R8vQa-0007C5-C3
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Sep 2011 16:48:04 +0200
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.83.0; Wed, 28 Sep 2011
	16:42:29 +0200
X-TM-IMSS-Message-ID: <056ac4f10006b907@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 056ac4f10006b907 ;
	Wed, 28 Sep 2011 16:39:39 +0200
Message-ID: <4E833255.4030508@nedap.com>
Date: Wed, 28 Sep 2011 16:42:29 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.21) Gecko/20110831 Lightning/1.0b2 Thunderbird/3.1.13
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E831A8E.5020903@nedap.com>
In-Reply-To: <4E831A8E.5020903@nedap.com>
Subject: Re: CONFFILES question
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
X-List-Received-Date: Wed, 28 Sep 2011 14:48:04 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

This seems to work.

def get_databasefiles():
     import os
     s=''
     for file in os.listdir('/var/lib/myproject'):
         s = s+' '+'/var/lib/myproject/'+file
     return s

CONFFILES_${PN} = "${@get_databasefiles()}"




On 09/28/2011 03:01 PM, Jaap de Jong wrote:
> Hi,
>
> I would really like to use some wildcards in a CONFFILES_${PN}.
>
> CONFFILES_${PN} = "/var/lib/myproject/*"
> Compiling this works, but installing ends with a error message.
>
> How should I accomplish this? Or is specifying all the files the only
> way to go?
>
> Jaap
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


