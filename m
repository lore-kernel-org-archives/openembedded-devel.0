Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id C47B9794EC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2018 22:14:04 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id r77-v6so4803047pgr.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2018 15:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=agYrMHxcTG/NDP7JXeBCcwjew0fwozzjRiTe1I8LBiI=;
	b=PpWxpWsK4ZhUPPJYYSY+eit7/8O5NrvsKkp4ZlG7FMRLpWcPrGATgSSBbArVHZA+r1
	0TXdbhtJ+YTUhyv+hf3b/8+07OVmt27olu1zlSA+7KOWwG4++UrhosOeH3E6HkMZROwl
	Noja7fjgIy6oD3iQ9zAjKAu5/e8s0k5D68lhpIwLN0kZSrmJs0N9LBfGo8w/jEw3Cv7L
	5S4lZ7ynFcKO8j5DPzaq/H+rIHN1VR39gBcknMNl0AF2hFsEai8goAksP5m3yjVEqjKv
	vC1/PCao7VTFWyrlimSZbPyHAg3uwUyPib5kLJAlcyWjHju0gbDrGEe8SatAZWTHb2PI
	pUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=agYrMHxcTG/NDP7JXeBCcwjew0fwozzjRiTe1I8LBiI=;
	b=IDmXOr3YykreFIUuinz+jRsp37NqwyXqxo9skg326seXsxH2jdRHU0Nad/gzMmLxCj
	cQnXs2sBqV0YIEStYvBkMuotIaI9zC8V+GKhfzYMYpOGixApVceKP3ltTmB44POeimbQ
	BSCyNDH+84d9u/dL8jizVn3I/qeyesq5olRizQlDm6TrN3nj+4qy0b8QyEF9wG0gpzrk
	Z8u90OQhMbXKKr7olm3JGuMPOHIuRjMkiVVPhLnnmjPHq351XOJqd7cb1u+l6BTQk8TT
	Yw+a6OdM+goYJL4UzTS9JwnsYDfN1qhJHNs/rq9b96K40SXmagVKgIzED9dVqrYR9dGX
	SAnw==
X-Gm-Message-State: ABuFfojlx39KYZ1y4vg1X1q9PocsOAaRM04RYW5CSEUgS95VbQArPC48
	u4eh8ptw9idLibf/tT6hqxNGKcX/
X-Google-Smtp-Source: ACcGV627ACoUtjOOwQceCcXzBgJU8YgJk4VjaqNoeD0TMN83VVmVThTMq2s9kRkqS44AxvrByxWinQ==
X-Received: by 2002:a62:d152:: with SMTP id t18-v6mr686424pfl.98.1537827245541;
	Mon, 24 Sep 2018 15:14:05 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:6924:aad7:81c1:2e32?
	([2601:202:4180:c33:6924:aad7:81c1:2e32])
	by smtp.gmail.com with ESMTPSA id
	g11-v6sm322651pgi.90.2018.09.24.15.14.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Sep 2018 15:14:04 -0700 (PDT)
To: Sinan Kaya <okaya@kernel.org>, openembedded-devel@lists.openembedded.org
References: <20180924192102.25124-1-okaya@kernel.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <55cc8cec-c2b6-e647-8d40-32c9fe6ac725@gmail.com>
Date: Mon, 24 Sep 2018 15:14:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180924192102.25124-1-okaya@kernel.org>
Subject: Re: [sumo] [meta-networking] [PATCH v1] dnsmasq: CVE-2017-15107
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Sep 2018 22:14:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Sinan,


Changes for meta-openembedded should be sent to "
openembedded-devel@lists.openembedded.org "

I went ahead and pulled this in.


On 09/24/2018 12:21 PM, Sinan Kaya wrote:
> * CVE-2017-15107
> A vulnerability was found in Dnsmasq's implementation of DNSSEC.
> Wildcard synthesized NSEC records could be improperly interpreted
> to prove the non-existence of hostnames that actually exist.
>
> Affects dnsmasq <=3D 2.78
Thanks for adding the above.

>
> CVE: CVE-2017-15107
> Ref: https://access.redhat.com/security/cve/cve-2017-15107
> Signed-off-by: Sinan Kaya <okaya@kernel.org>
> ---
>  .../recipes-support/dnsmasq/dnsmasq_2.78.bb   |   1 +
>  .../dnsmasq/files/CVE-2017-15107.patch        | 262 ++++++++++++++++++=

>  2 files changed, 263 insertions(+)
>  create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2=
017-15107.patch
>
> diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.78.bb b/=
meta-networking/recipes-support/dnsmasq/dnsmasq_2.78.bb
> index 4d1dc6e69..d2465f82d 100644
> --- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.78.bb
> +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.78.bb
> @@ -2,6 +2,7 @@ require dnsmasq.inc
> =20
>  SRC_URI +=3D "\
>      file://lua.patch \
> +    file://CVE-2017-15107.patch \
>  "
> =20
>  SRC_URI[dnsmasq-2.78.md5sum] =3D "3bb97f264c73853f802bf70610150788"
> diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2017-151=
07.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2017-15107.p=
atch
> new file mode 100644
> index 000000000..da2af56cf
> --- /dev/null
> +++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2017-15107.patc=
h
> @@ -0,0 +1,262 @@
> +From 5a56e1b78a753d3295564daddc9ce389cc69fd68 Mon Sep 17 00:00:00 2001=

> +From: Simon Kelley <simon@thekelleys.org.uk>
> +Date: Fri, 19 Jan 2018 12:26:08 +0000
> +Subject: [PATCH] DNSSEC fix for wildcard NSEC records. CVE-2017-15107 =
applies.
> +
> +It's OK for NSEC records to be expanded from wildcards,
> +but in that case, the proof of non-existence is only valid
> +starting at the wildcard name, *.<domain> NOT the name expanded
> +from the wildcard. Without this check it's possible for an
> +attacker to craft an NSEC which wrongly proves non-existence
> +in a domain which includes a wildcard for NSEC.
> +
> +Upstream-Status: Backport [http://thekelleys.org.uk/gitweb/?p=3Ddnsmas=
q.git;a=3Dcommit;h=3D4fe6744a220eddd3f1749b40cac3dfc510787de6]
Missing the CVE tag in the patch;

CVE:=C2=A0 CVE-2017-15107

I just added it and have it in my test branch

thanks
Armin
> +Signed-off-by: Sinan Kaya <okaya@kernel.org>
> +---
> + CHANGELOG    |  44 +++++++++++++++++++
> + src/dnssec.c | 117 +++++++++++++++++++++++++++++++++++++++++++++-----=
-
> + 2 files changed, 147 insertions(+), 14 deletions(-)
> +
> +diff --git a/CHANGELOG b/CHANGELOG
> +index 075fe1a6..5226dce8 100644
> +--- a/CHANGELOG
> ++++ b/CHANGELOG
> +@@ -1,3 +1,47 @@
> ++version 2.79
> ++	Fix parsing of CNAME arguments, which are confused by extra spaces.
> ++	Thanks to Diego Aguirre for spotting the bug.
> ++
> ++	Where available, use IP_UNICAST_IF or IPV6_UNICAST_IF to bind
> ++	upstream servers to an interface, rather than SO_BINDTODEVICE.
> ++	Thanks to Beniamino Galvani for the patch.
> ++
> ++	Always return a SERVFAIL answer to DNS queries without the
> ++	recursion desired bit set, UNLESS acting as an authoritative
> ++	DNS server. This avoids a potential route to cache snooping.
> ++
> ++	Add support for Ed25519 signatures in DNSSEC validation.
> ++
> ++	No longer support RSA/MD5 signatures in DNSSEC validation,
> ++	since these are not secure. This behaviour is mandated in
> ++	RFC-6944.
> ++
> ++	Fix incorrect error exit code from dhcp_release6 utility.
> ++	Thanks Gaudenz Steinlin for the bug report.
> ++
> ++	Use SIGINT (instead of overloading SIGHUP) to turn on DNSSEC
> ++	time validation when --dnssec-no-timecheck is in use.
> ++	Note that this is an incompatible change from earlier releases.
> ++
> ++	Allow more than one --bridge-interface option to refer to an
> ++	interface, so that we can use
> ++	--bridge-interface=3Dint1,alias1
> ++	--bridge-interface=3Dint1,alias2
> ++	as an alternative to
> ++	--bridge-interface=3Dint1,alias1,alias2
> ++	Thanks to Neil Jerram for work on this.
> ++
> ++	Fix for DNSSEC with wildcard-derived NSEC records.
> ++	It's OK for NSEC records to be expanded from wildcards,
> ++	but in that case, the proof of non-existence is only valid
> ++	starting at the wildcard name, *.<domain> NOT the name expanded
> ++	from the wildcard. Without this check it's possible for an
> ++	attacker to craft an NSEC which wrongly proves non-existence.
> ++	Thanks to Ralph Dolmans for finding this, and co-ordinating=20
> ++	the vulnerability tracking and fix release.
> ++	CVE-2017-15107 applies.
> ++
> ++
> + version 2.78
> +         Fix logic of appending ".<layer>" to PXE basename. Thanks to =
Chris
> + 	Novakovic for the patch.
> +diff --git a/src/dnssec.c b/src/dnssec.c
> +index a74d01ab..1417be56 100644
> +--- a/src/dnssec.c
> ++++ b/src/dnssec.c
> +@@ -424,15 +424,17 @@ static void from_wire(char *name)
> + static int count_labels(char *name)
> + {
> +   int i;
> +-
> ++  char *p;
> ++ =20
> +   if (*name =3D=3D 0)
> +     return 0;
> +=20
> +-  for (i =3D 0; *name; name++)
> +-    if (*name =3D=3D '.')
> ++  for (p =3D name, i =3D 0; *p; p++)
> ++    if (*p =3D=3D '.')
> +       i++;
> +=20
> +-  return i+1;
> ++  /* Don't count empty first label. */
> ++  return *name =3D=3D '.' ? i : i+1;
> + }
> +=20
> + /* Implement RFC1982 wrapped compare for 32-bit numbers */
> +@@ -1405,8 +1407,8 @@ static int hostname_cmp(const char *a, const cha=
r *b)
> +     }
> + }
> +=20
> +-static int prove_non_existence_nsec(struct dns_header *header, size_t=
 plen, unsigned char **nsecs, int nsec_count,
> +-				    char *workspace1, char *workspace2, char *name, int type, int=
 *nons)
> ++static int prove_non_existence_nsec(struct dns_header *header, size_t=
 plen, unsigned char **nsecs, unsigned char **labels, int nsec_count,
> ++				    char *workspace1_in, char *workspace2, char *name, int type, =
int *nons)
> + {
> +   int i, rc, rdlen;
> +   unsigned char *p, *psave;
> +@@ -1419,6 +1421,9 @@ static int prove_non_existence_nsec(struct dns_h=
eader *header, size_t plen, unsi
> +   /* Find NSEC record that proves name doesn't exist */
> +   for (i =3D 0; i < nsec_count; i++)
> +     {
> ++      char *workspace1 =3D workspace1_in;
> ++      int sig_labels, name_labels;
> ++
> +       p =3D nsecs[i];
> +       if (!extract_name(header, plen, &p, workspace1, 1, 10))
> + 	return 0;
> +@@ -1427,7 +1432,27 @@ static int prove_non_existence_nsec(struct dns_=
header *header, size_t plen, unsi
> +       psave =3D p;
> +       if (!extract_name(header, plen, &p, workspace2, 1, 10))
> + 	return 0;
> +-     =20
> ++
> ++      /* If NSEC comes from wildcard expansion, use original wildcard=

> ++	 as name for computation. */
> ++      sig_labels =3D *labels[i];
> ++      name_labels =3D count_labels(workspace1);
> ++
> ++      if (sig_labels < name_labels)
> ++	{
> ++	  int k;
> ++	  for (k =3D name_labels - sig_labels; k !=3D 0; k--)
> ++	    {
> ++	      while (*workspace1 !=3D '.' && *workspace1 !=3D 0)
> ++		workspace1++;
> ++	      if (k !=3D 1 && *workspace1 =3D=3D '.')
> ++		workspace1++;
> ++	    }
> ++	 =20
> ++	  workspace1--;
> ++	  *workspace1 =3D '*';
> ++	}
> ++	 =20
> +       rc =3D hostname_cmp(workspace1, name);
> +      =20
> +       if (rc =3D=3D 0)
> +@@ -1825,24 +1850,26 @@ static int prove_non_existence_nsec3(struct dn=
s_header *header, size_t plen, uns
> +=20
> + static int prove_non_existence(struct dns_header *header, size_t plen=
, char *keyname, char *name, int qtype, int qclass, char *wildname, int *=
nons)
> + {
> +-  static unsigned char **nsecset =3D NULL;
> +-  static int nsecset_sz =3D 0;
> ++  static unsigned char **nsecset =3D NULL, **rrsig_labels =3D NULL;
> ++  static int nsecset_sz =3D 0, rrsig_labels_sz =3D 0;
> +  =20
> +   int type_found =3D 0;
> +-  unsigned char *p =3D skip_questions(header, plen);
> ++  unsigned char *auth_start, *p =3D skip_questions(header, plen);
> +   int type, class, rdlen, i, nsecs_found;
> +  =20
> +   /* Move to NS section */
> +   if (!p || !(p =3D skip_section(p, ntohs(header->ancount), header, p=
len)))
> +     return 0;
> ++
> ++  auth_start =3D p;
> +  =20
> +   for (nsecs_found =3D 0, i =3D ntohs(header->nscount); i !=3D 0; i--=
)
> +     {
> +       unsigned char *pstart =3D p;
> +      =20
> +-      if (!(p =3D skip_name(p, header, plen, 10)))
> ++      if (!extract_name(header, plen, &p, daemon->workspacename, 1, 1=
0))
> + 	return 0;
> +-     =20
> ++	 =20
> +       GETSHORT(type, p);=20
> +       GETSHORT(class, p);
> +       p +=3D 4; /* TTL */
> +@@ -1859,7 +1886,69 @@ static int prove_non_existence(struct dns_heade=
r *header, size_t plen, char *key
> + 	  if (!expand_workspace(&nsecset, &nsecset_sz, nsecs_found))
> + 	    return 0;=20
> + 	 =20
> +-	  nsecset[nsecs_found++] =3D pstart;
> ++	  if (type =3D=3D T_NSEC)
> ++	    {
> ++	      /* If we're looking for NSECs, find the corresponding SIGs, to=
=20
> ++		 extract the labels value, which we need in case the NSECs
> ++		 are the result of wildcard expansion.
> ++		 Note that the NSEC may not have been validated yet
> ++		 so if there are multiple SIGs, make sure the label value
> ++		 is the same in all, to avoid be duped by a rogue one.
> ++		 If there are no SIGs, that's an error */
> ++	      unsigned char *p1 =3D auth_start;
> ++	      int res, j, rdlen1, type1, class1;
> ++	     =20
> ++	      if (!expand_workspace(&rrsig_labels, &rrsig_labels_sz, nsecs_f=
ound))
> ++		return 0;
> ++	     =20
> ++	      rrsig_labels[nsecs_found] =3D NULL;
> ++	     =20
> ++	      for (j =3D ntohs(header->nscount); j !=3D 0; j--)
> ++		{
> ++		  if (!(res =3D extract_name(header, plen, &p1, daemon->workspacena=
me, 0, 10)))
> ++		    return 0;
> ++
> ++		   GETSHORT(type1, p1);=20
> ++		   GETSHORT(class1, p1);
> ++		   p1 +=3D 4; /* TTL */
> ++		   GETSHORT(rdlen1, p1);
> ++
> ++		   if (!CHECK_LEN(header, p1, plen, rdlen1))
> ++		     return 0;
> ++		  =20
> ++		   if (res =3D=3D 1 && class1 =3D=3D qclass && type1 =3D=3D T_RRSIG=
)
> ++		     {
> ++		       int type_covered;
> ++		       unsigned char *psav =3D p1;
> ++		      =20
> ++		       if (rdlen < 18)
> ++			 return 0; /* bad packet */
> ++
> ++		       GETSHORT(type_covered, p1);
> ++
> ++		       if (type_covered =3D=3D T_NSEC)
> ++			 {
> ++			   p1++; /* algo */
> ++			  =20
> ++			   /* labels field must be the same in every SIG we find. */
> ++			   if (!rrsig_labels[nsecs_found])
> ++			     rrsig_labels[nsecs_found] =3D p1;
> ++			   else if (*rrsig_labels[nsecs_found] !=3D *p1) /* algo */
> ++			     return 0;
> ++			   }
> ++		       p1 =3D psav;
> ++		     }
> ++		  =20
> ++		   if (!ADD_RDLEN(header, p1, plen, rdlen1))
> ++		     return 0;
> ++		}
> ++
> ++	      /* Must have found at least one sig. */
> ++	      if (!rrsig_labels[nsecs_found])
> ++		return 0;
> ++	    }
> ++
> ++	  nsecset[nsecs_found++] =3D pstart;  =20
> + 	}
> +      =20
> +       if (!ADD_RDLEN(header, p, plen, rdlen))
> +@@ -1867,7 +1956,7 @@ static int prove_non_existence(struct dns_header=
 *header, size_t plen, char *key
> +     }
> +  =20
> +   if (type_found =3D=3D T_NSEC)
> +-    return prove_non_existence_nsec(header, plen, nsecset, nsecs_foun=
d, daemon->workspacename, keyname, name, qtype, nons);
> ++    return prove_non_existence_nsec(header, plen, nsecset, rrsig_labe=
ls, nsecs_found, daemon->workspacename, keyname, name, qtype, nons);
> +   else if (type_found =3D=3D T_NSEC3)
> +     return prove_non_existence_nsec3(header, plen, nsecset, nsecs_fou=
nd, daemon->workspacename, keyname, name, qtype, wildname, nons);
> +   else
> +--=20
> +2.19.0
> +



