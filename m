Received: from [66.249.92.169] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <nicolasfr@gmail.com>) id 1Gp80U-000142-KQ
	for Openembedded-devel@lists.openembedded.org;
	Tue, 28 Nov 2006 19:48:38 +0100
Received: by ug-out-1314.google.com with SMTP id e2so1332158ugf
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 28 Nov 2006 10:48:24 -0800 (PST)
Received: by 10.78.201.2 with SMTP id y2mr1218481huf.1164739704396;
	Tue, 28 Nov 2006 10:48:24 -0800 (PST)
Received: by 10.78.160.8 with HTTP; Tue, 28 Nov 2006 10:48:24 -0800 (PST)
Message-ID: <b9481e140611281048o268a7e61sff22d3be013eeb67@mail.gmail.com>
Date: Tue, 28 Nov 2006 19:48:24 +0100
From: "Nicolas FR" <nicolasfr@gmail.com>
To: papercrane@reversefold.com, Openembedded-devel@lists.openembedded.org
In-Reply-To: <432beae0611271334s4032a138n62e85d8dddd45993@mail.gmail.com>
MIME-Version: 1.0
References: <b9481e140611271305j26d156e8r3fb35fb3ff35be68@mail.gmail.com>
	<b9481e140611271333h2aad2dcxa8a2f48847ff64ea@mail.gmail.com>
	<432beae0611271334s4032a138n62e85d8dddd45993@mail.gmail.com>
Subject: Re: Small fix for sharprom
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
X-List-Received-Date: Tue, 28 Nov 2006 18:48:38 -0000
X-Groupsio-MsgNum: 846
Content-Type: multipart/mixed; 
	boundary="----=_Part_14380_15420755.1164739704289"

------=_Part_14380_15420755.1164739704289
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Attachment is posted with .txt extension. Should make it to the list now...

If not the fix is in palmtop.bbclass:
-CPP_SUPPORT_LIB_sharprom = "LIBS-=-lstdc++"
+CPP_SUPPORT_LIB_sharprom-compatible = "LIBS+=-lstdc++"


On 11/27/06, Justin Patrin <papercrane@gmail.com> wrote:
> Still didn't make it to the list.
>
> On 11/27/06, Nicolas FR <nicolasfr@gmail.com> wrote:
> > Oops, screwed up my own patch!

------=_Part_14380_15420755.1164739704289
Content-Type: text/plain; name=palmtop.txt; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ev2nv86v
Content-Disposition: attachment; filename="palmtop.txt"

LS0tIGNsYXNzZXMvcGFsbXRvcC5iYmNsYXNzICAgICBhMWZhN2M5ZTQyYjJjZGNhNTE5ODRlNmUz
N2NjZTVhYzEwZmFiNmFjCisrKyBjbGFzc2VzL3BhbG10b3AuYmJjbGFzcyAgICAgMmZmZjY0ZTk3
NjBjNDQ0NmM4NTkwMGEwZDJhNjg1YzQzYWM5YjViNwpAQCAtMTEsNyArMTEsNyBAQCBDUFBfU1VQ
UE9SVF9MSUIgPSAiTElCUy09LWxzdGRjKysgTElCUys9CiAKICMgc3BlY2lhbCBjYXNlIGZvciBE
SVNUUk8gPSBzaGFycHJvbQogQ1BQX1NVUFBPUlRfTElCID0gIkxJQlMtPS1sc3RkYysrIExJQlMr
PS1sc3VwYysrIgotQ1BQX1NVUFBPUlRfTElCX3NoYXJwcm9tID0gIkxJQlMtPS1sc3RkYysrIgor
Q1BQX1NVUFBPUlRfTElCX3NoYXJwcm9tLWNvbXBhdGlibGUgPSAiTElCUys9LWxzdGRjKysiCiBF
WFRSQV9RTUFLRVZBUlNfUE9TVCArPSAiREVGSU5FUys9UVdTIENPTkZJRys9cXQgJHtDUFBfU1VQ
UE9SVF9MSUJ9IgogRVhUUkFfUU1BS0VWQVJTX1BPU1QgKz0gJyR7QGJhc2VfY29uZGl0aW9uYWwo
IlBBTE1UT1BfVVNFX01VTFRJVEhSRUFERURfUVQiLCAieWVzIiwgIkNPTkZJRys9dGhyZWFkIiwg
IkNPTkZJRy09dGhyZWFkIixkKX0nCiBFWFRSQV9RTUFLRVZBUlNfUE9TVCArPSAiJHtAWyJMSUJT
Kz0tbHFwZSAiLCAiIl1bKGJiLmRhdGEuZ2V0VmFyKCdQTicsIGQsIDEpID09ICdsaWJxcGUtb3Bp
ZScpXX0iCg==

------=_Part_14380_15420755.1164739704289--
