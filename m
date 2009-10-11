Received: from [209.85.222.189] (helo=mail-pz0-f189.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mail@april1985.com>) id 1Mx14X-0002Rq-Bl
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Oct 2009 18:15:04 +0200
Received: by pzk27 with SMTP id 27so2048285pzk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Oct 2009 09:14:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.143.154.33 with SMTP id g33mr390551wfo.300.1255277647381; Sun, 
	11 Oct 2009 09:14:07 -0700 (PDT)
In-Reply-To: <fd72b8f50910110853u46dc80dbr5ba7410e0a6a0840@mail.gmail.com>
References: <fd72b8f50910110737u5cf0c64dv2e352feaa2c46e1@mail.gmail.com>
	<200910111658.23873.holger+oe@freyther.de>
	<fd72b8f50910110853u46dc80dbr5ba7410e0a6a0840@mail.gmail.com>
Date: Mon, 12 Oct 2009 00:14:07 +0800
Message-ID: <fd72b8f50910110914u3b9ddbfcsaea33748a3a68345@mail.gmail.com>
From: mail mail <mail@april1985.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.189
X-SA-Exim-Mail-From: mail@april1985.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: imagemagick-native-6.3.5 compile problems
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
X-List-Received-Date: Sun, 11 Oct 2009 16:15:04 -0000
X-Groupsio-MsgNum: 13406
Content-Type: multipart/mixed; boundary=001636e0b6ee4446100475ab1a6a

--001636e0b6ee4446100475ab1a6a
Content-Type: text/plain; charset=ISO-8859-1

Hi, Holger Hans Peter Freyther
Thank you for your direction. I finished compile it and here is my patch:

--- delegate.c    2007-09-11 11:20:41.000000000 +0800
+++ delegate.c    2009-10-12 00:04:45.000000000 +0800
@@ -769,7 +769,7 @@
   /*
     Copy source file to destination.
   */
-  destination_file=open(destination,O_WRONLY | O_BINARY | O_CREAT);
+  destination_file=open(destination,O_WRONLY | O_BINARY | O_CREAT, 0777);
   if (destination_file == -1)
     return;
   source_file=open(source,O_RDONLY | O_BINARY);

2009/10/11 mail mail <mail@april1985.com>

>
> Ni Hao too, haha.
> How could you know I'm Chinese ^_^
>
> Thanks, I'll check it.
>
> 2009/10/11 Holger Hans Peter Freyther <holger+oe@freyther.de<holger%2Boe@freyther.de>
> >
>
> On Sunday 11 October 2009 16:37:19 mail mail wrote:
>> > Hi, all
>> > I'm compiling x11-sato-image. I chose mini2440 as my machine and
>> angstrom
>> >  as distro.
>>
>> Ni Hao,
>>
>> sorry this is not how it is working. Ask on IRC or google/baidu first.
>>
>>
>> You are using a fortify enabled compiler and the open call lacks a third
>> argument. Just create a patch to change the open call to have the access
>> mode
>> in it as well, send a patch, we will be happy to apply it.
>>
>>
>> z.
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>

--001636e0b6ee4446100475ab1a6a
Content-Type: application/octet-stream; name="delegate.patch"
Content-Disposition: attachment; filename="delegate.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g0nzvnej0

LS0tIGRlbGVnYXRlLmMJMjAwNy0wOS0xMSAxMToyMDo0MS4wMDAwMDAwMDAgKzA4MDANCisrKyBk
ZWxlZ2F0ZS5jCTIwMDktMTAtMTIgMDA6MDQ6NDUuMDAwMDAwMDAwICswODAwDQpAQCAtNzY5LDcg
Kzc2OSw3IEBADQogICAvKg0KICAgICBDb3B5IHNvdXJjZSBmaWxlIHRvIGRlc3RpbmF0aW9uLg0K
ICAgKi8NCi0gIGRlc3RpbmF0aW9uX2ZpbGU9b3BlbihkZXN0aW5hdGlvbixPX1dST05MWSB8IE9f
QklOQVJZIHwgT19DUkVBVCk7DQorICBkZXN0aW5hdGlvbl9maWxlPW9wZW4oZGVzdGluYXRpb24s
T19XUk9OTFkgfCBPX0JJTkFSWSB8IE9fQ1JFQVQsIDA3NzcpOw0KICAgaWYgKGRlc3RpbmF0aW9u
X2ZpbGUgPT0gLTEpDQogICAgIHJldHVybjsNCiAgIHNvdXJjZV9maWxlPW9wZW4oc291cmNlLE9f
UkRPTkxZIHwgT19CSU5BUlkpOw==

--001636e0b6ee4446100475ab1a6a--
