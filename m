Received: from [217.146.189.78] (helo=web23308.mail.ird.yahoo.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <claudiu_fw85@yahoo.it>) id 1LwexN-0000If-6I
	for openembedded-devel@openembedded.org; Wed, 22 Apr 2009 18:05:53 +0200
Received: (qmail 20385 invoked by uid 60001); 22 Apr 2009 16:01:19 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.it; s=s1024;
	t=1240416079; bh=ZSc3OeZfmMVDGbLHZLY9iMJ/nnGTxk523bi0b4v6oEw=;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=XgkKbX3e/+kbbfA061H+INQHsEHEh2AJgXGeDQQbakGh7ORdtJFToXJxsfITWL/63Wp/eAYTdO0VLeMcGEnjNz6A8r957JdXzXTTmROWBc6F+KeJb1VAyblAMN74teBnvBCzcu/NAKxRi13S3JtyeIgxvvwKYIwLE3r8tMSeOts=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.it;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=ZZXXMBvPj0a5BK9eTRf8CLpu+vQLslJENbx3rXTqvtKIZRsF0ilcwIPnALM55yg170V3mFjBs9s+2bnQRnHHdaiEEV7Q8QH27JdAvdcbN7RqL3p4F9mERxyrL7cz8vHm6KTvd4yDvvcPtU5STZVpNq8zjr7lhcz6cIZVKiqkEZ4=;
Message-ID: <186800.19618.qm@web23308.mail.ird.yahoo.com>
X-YMail-OSG: bKMZo4kVM1kl67fGZ8TXh___TLtrMQFePR2aC57zacx8ifIlN0Pa_9VZCKPDr3TjpyYNhDhR1mwxmOuimYw7IchGgHhenLFfluKAlxJ40qXH7cEfTqitFMgX2aKngjRixXvUiFLe5TKzHojSUaT3pgMzp1canjXWpYZwzIxvL9DRsiOrgzswGcdgebezMyGa1ow0X0fYvs.CJeyewCbBqg894Qp39ZUofx87Ef_UgPbheTogCb6A_w4HQxudqFaVTjfHYnZtzztXERur
Received: from [87.5.248.219] by web23308.mail.ird.yahoo.com via HTTP;
	Wed, 22 Apr 2009 16:01:18 GMT
X-Mailer: YahooMailWebService/0.7.289.1
Date: Wed, 22 Apr 2009 16:01:18 +0000 (GMT)
From: Claudiu mdc <claudiu_fw85@yahoo.it>
To: openembedded-devel@openembedded.org
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: intltool dependence: libxml-parser-perl-native
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
X-List-Received-Date: Wed, 22 Apr 2009 16:05:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,
I had a problem when building my image in OE. The build process stopped on=
 "intltool" with this error:
checking for perl... /home/claudiu/oeDevel/tmpoe/staging/i686-linux/usr/bi=
n/perl
checking for XML::Parser... configure: error: XML::Parser perl module is r=
equired for intltoolFATAL: oe_runconf failed
To solve this you just have to build "libxml-parser-perl-native" package, =
clean the previous intltool (bitbake intltool -c clean) and rebuild it.

("libxml-parser-perl-native" is a dependence for "intltool")




From otavio.salvador@gmail.com Wed Apr 22 18:26:10 2009
Received: from [209.85.132.249] (helo
