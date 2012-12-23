Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Tms0e-0002GU-Gn
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 21:18:59 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Dec 2012 12:04:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,343,1355126400"; d="scan'208";a="269159243"
Received: from unknown (HELO helios.localnet) ([10.252.123.19])
	by fmsmga002.fm.intel.com with ESMTP; 23 Dec 2012 12:04:01 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 23 Dec 2012 20:03:59 +0000
Message-ID: <1399407.2onAcIL7L6@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-21-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <d4bafb35d0dff694a16e40856448eeb12a0fd05e.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
	<d4bafb35d0dff694a16e40856448eeb12a0fd05e.1356264861.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 16/30] hddtemp: apply hddtemp-db.patch to our hddtemp.db
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
X-List-Received-Date: Sun, 23 Dec 2012 20:18:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 23 December 2012 13:21:41 Martin Jansa wrote:
> * some versions of patch utility refuse to accept such patch:
>   ERROR: Command Error: exit status: 1  Output:
>   Applying patch hddtemp-db.patch
>   Ignoring potentially dangerous file name ../hddtemp.db
>   can't find file to patch at input line 7
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../hddtemp/hddtemp/hddtemp-db.patch               | 133
> --------------------- meta-oe/recipes-support/hddtemp/hddtemp/hddtemp.db | 
> 34 ++++--
>  .../recipes-support/hddtemp/hddtemp_0.3-beta15.bb  |   3 +-
>  3 files changed, 23 insertions(+), 147 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/hddtemp/hddtemp/hddtemp-db.patch
> 
> diff --git a/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp-db.patch
> b/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp-db.patch deleted file
> mode 100644
> index a71a9dd..0000000
> --- a/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp-db.patch
> +++ /dev/null
> @@ -1,133 +0,0 @@
> -hddtemp database update
> -
> -Patch from Fedora 18 SRPM.
> -
> ---- ../hddtemp.db~	2007-09-14 21:11:37.000000000 +0300
> -+++ ../hddtemp.db	2008-02-09 22:10:31.000000000 +0200
> -@@ -80,6 +80,8 @@
> -
> - "FUJITSU MHV2100AH"		194  C	"FUJITSU MHV2100AH"
> - "FUJITSU MHV2100AT"		194  C	"FUJITSU MHV2100AT"
> -+"FUJITSU MHV2100BH"		194  C  "FUJITSU MHV2100BH"
> -+"FUJITSU MHV2060AH"		194  C  "FUJITSU MHV2060AH"
> - "FUJITSU MHV2080[AB]H"		194  C	"FUJITSU MHV2080AH"
> -
> - "FUJITSU MPF3204AH"		194  C	"Fujitsu MPF3204AH"
> -@@ -325,11 +327,14 @@
> - "ST3120026A"				194  C	"Seagate Barracuda V ST3120026A"
> - "ST3160021A"				194  C	"Seagate Barracuda 7200.7 - ST3160021A"
> - "ST3160023(A|AS)"			194  C	"Seagate Barracuda V ST3160023A and AS 
(160Gb,
> ATA100 or Serial ATA)" -+"ST316081[12](A|AS)"			194  C  "Seagate 
Barracuda
> 7200.9 160GB"
> - "ST3160827AS"				194  C	"Seagate Barracuda 7200.7 160GB (Serial 
ATA)"
> - "ST3200021A"				194  C	"Seagate Barracuda 7200.7 Plus 200GB"
> - "ST3200822(A|AS)"			194  C	"Seagate Barracuda 7200.7 Plus 200GB 
(PATA or
> SATA)" --"ST3200826A"				194  C	"Seagate Barracuda 7200.8 200Gb"
> -+"ST3200826A"				194  C	"Seagate Barracuda 7200.8 200GB"
> - "ST3250623A"				194  C	"Seagate Barracuda 7200.16 250GB"
> -+"ST3250624AS"				194  C  "Seagate Barracuda 7200.9 250GB SATA"
> -+"ST3250624NS"				194  C  "Seagate NL35 SATA (RAID-Edition) 7200 
250GB"
> - "ST3250823A"				194  C	"Seagate Barracuda 7200.8 250GB"
> - "ST3250823A"				194  C	"Seagate Barracuda 7200.7 Plus 250GB"
> - "ST3250823NS"				194  C	"Seagate NL35 SATA (RAID-Edition) 7200 
250GB"
> -@@ -338,9 +343,7 @@
> - "ST3400633(A|AS)"                       194  C  "Seagate Barracuda 7200.7
> 400 GB" - "ST3500630NS"				194  C  "Seagate"
> - "ST3400632NS"				194  C	"Seagate"
> --"ST3320620AS"                           194  C  "Seagate Barracuda 7200.7
> 320 GB" --"ST3500630AS"                           194  C  "Seagate
> Barracuda 7200.7 500 GB" --"ST3802110A"				194  C	"Seagate Barracuda 
7200.9
> 80 GB"
> -+"ST380[28]110(A|AS)"				194  C	"Seagate Barracuda 7200.9 80 GB"
> - "ST910021A"				194  C	"Seagate Momentus 7200.1 100GB"
> - "ST910082[35]A"				194  C	"Seagate Momentus 5400.2 100GB"
> - "ST9120821A"				194  C	"Seagate Momentus 5400.2 120GB"
> -@@ -351,12 +354,14 @@
> - "ST960822A"				194  C	"Seagate Momentus 5400.2 60GB"
> - "ST96812AS"				194  C	"Seagate Momentus 5400.2 60GB SATA"
> - "ST9808211A"				194  C	"Seagate Momentus 5400.2 80GB"
> -+"ST98823AS"				194  C  "Seagate Momentus 5400.2 80GB SATA"
> -
> - ########################################
> - ############# TOSHIBA Laptops
> - ########################################
> - "MK4313MAT"				220  C	"Toshiba MK4313MAT"
> - "TOSHIBA MK1032GAX"			194  C	"Toshiba MK1032GAX"
> -+"TOSHIBA MK1032GSX"			194  C  "Toshiba MK1032GSX"
> - "TOSHIBA MK1517GAP"			0    C	"Toshiba MK1517GAP"
> - "TOSHIBA MK2018GAS"			226  F	"Toshiba MK2018GAS"
> - "TOSHIBA MK2023GAS"			194  C	"Toshiba MK2023GAS"
> -@@ -377,6 +382,7 @@
> - "TOSHIBA MK6026GAX"			194  C	"Toshiba MK6026GAX"
> - "TOSHIBA MK8025GAS"			194  C	"Toshiba MK8025GAS"
> - "TOSHIBA MK8026GAX"			194  C	"Toshiba MK8026GAX"
> -+"TOSHIBA MK8032GSX"			194  C  "Toshiba MK8032GSX"
> -
> - "MK4025GAS"				194  C	"Toshiba MK4025GAS"
> -
> -@@ -397,7 +403,7 @@
> - "WDC WD300BB-00CAA0"						  0 C "Western Digital WD300BB"
> - "WDC WD360GD-00FNA0"						194 C "Western Digital SATA Raptor 
36.7GB"
> - "WDC WD400BB-00CAA0"						  0 C "Western Digital 400BB-00CAA0"
> --"WDC WD400BB-00J[KH]A0"						194 C "Western Digital Caviar 
WD400BB"
> -+"WDC WD400BB-00[DJ][KH]A0"					194 C "Western Digital Caviar 
WD400BB"
> - "WDC WD400BB-23JHC0"						194 C "Western Digital 23JHC0"
> - #"WDC WD400BB-00GFA0"						  0 C ""
> - "WDC WD400BB-55HEA0"						194 C "Western Digital Caviar WD400BB"
> -@@ -416,7 +422,7 @@
> - "WDC WD600VE-75HDT0"						194 C "Western Digital 600VE-75HDT0"
> - "WDC WD600VE-00HDT0"						194 C "Western Digital 600VE-00HDT0"
> - "WDC WD740GD-00FL21.0"						194 C "Western Digital SATA 
Raptor"
> --"WDC WD740GD-([05]0FL[AC]0|75FLA1)"				194 C "Western Digital SATA 
Raptor
> 74GB 8MB" -+"WDC WD740GD-([05]0FL[AC][01]|75FLA1)"				194 C "Western
> Digital SATA Raptor 74GB 8MB" - "WDC WD800BB-00CAA1"						  0 C 
"Western
> Digital WD800BB-00CAA1" - "WDC WD800BB-(00|22)DKA0"					194 C 
"Western
> Digital WD800BB 80 Go" - "WDC WD800BB-32CCB0"						194 C "Western 
Digital
> 800BB-32CCB0"
> -@@ -428,14 +434,13 @@
> - "WDC WD800JB-00CRA1"						  0 C "Western Digital Caviar WD800JB"
> - "WDC WD800JB-00(ET|FM|FS)A0"					194 C "Western Digital Caviar 
80GB
> Special Edition 8MB" - "WDC WD800JB-00JJ[AC]0"						194 C 
"Western Digital
> WD800JB"
> --"WDC WD800JD-(00|55)(HK|JR)A0"					194 C "Western Digital SATA 
80GB, 8MB
> Cache" --"WDC WD800JD-00(HK|JN)A0"					194 C "Western Digital SATA 
80GB,
> 8MB Cache" -+"WDC WD800JD-(00|55|75)(HK|JR|JN)[AC]0"				194 C 
"Western
> Digital SATA 80GB, 8MB Cache" - "WDC WD800LB-(00|55)DNA0"					194 
C
> "Western Digital Caviar WD800LB 80 Go ATA-100" - "WDC
> WD800VE-07HDT0"						194 C "Western Digital 800VE-07HDT0"
> - "WDC WD1200BB-00(FTA|GUA)0"					194 C "Western Digital Caviar 
EIDE 2MB
> Cache" --"WDC WD1200JB-00(EV|FU|GV)A0"					194 C "Western Digital 
Caviar
> 120GB Special Edition 8MB" -+"WDC WD1200JB-00(EV|FU|GV|RE)A0"				194 
C
> "Western Digital Caviar 120GB Special Edition 8MB" - "WDC
> WD1200JB-22GVA0"						194 C "Western Digital Caviar 120GB"
> --"WDC WD1200JD-00(GBB|HBC)0"					194 C "Western Digital WD1200JD"
> -+"WDC WD1200JD-00(FYB|GBB|HBC)0"					194 C "Western Digital 
WD1200JD"
> - "WDC WD1200LB-55EDA0"						194 C "Western Digital WD1220LB"
> - "WDC WD1200SB-01KB[AC]0"					194 C "Western Digital Caviar RE 
(Raid
> Edition) 120 GB" - "WDC WD1600BB-00DWA0"						194 C "Western 
Digital Caviar
> WD1600BB" -@@ -443,10 +448,11 @@
> - "WDC WD2000BB-00FTA0"						194 C "Western Digital WD2000BB"
> - "WDC WD2000JB-(00EV|32EV|34EV|00FU|00GV|55GV|98GV|00KF)A0"	194 C "Western
> Digital Caviar 200GB Special Edition 8MB" - "WDC WD2000JB-00GVC0"					
	194
> C "Western Digital WD2000JB"
> -+"WDC WD2000JD-00FYB0"						194 C "Western Digital WD2000JD"
> - "WDC WD2000JS-00MHB1"						194 C "Western Digital SATA 200GB"
> - "WDC WD2500JB-(00RE|00EV|00FU|32FU|00GV|55GV)A0"		194 C "Western Digital
> Caviar 250GB Special Edition 8MB" - "WDC WD2500JB-00GVC0"						
194 C
> "Western Digital 250GB"
> --"WDC WD2500JD-(00G|32H)BB0"					194 C "Western Digital SATA Caviar 
250GB
> Special Edition 8MB" -+"WDC WD2500JD-(00G|32H|75H)BB0"					194 C 
"Western
> Digital SATA Caviar 250GB Special Edition 8MB" - "WDC
> WD2500JD-40HBC0"						194 C "Western Digital WD2500JD-40HBC0" - 
"WDC
> WD2500PB-98FBA0"						194 C "Western Digital Caviar 250GB 
Special Edition
> 8MB" - "WDC WD2500PD-00FZB1"						194 C "Western Digital 
WD2500PD-00FZB1"
> -@@ -510,7 +516,7 @@
> - "Maxtor 7(L|V)300(F|R|S)0"		194 C "Maxtor MaXLine III 300GB 7200rpm"
> - "MAXTOR STM3320620AS"			194 C ""
> -
> --"WDC WD1500ADFD-00NLR1"                                         194 C
> "Western Digital Raptor 150GB" -+"WDC WD1500ADFD-00NLR[01]"                
>                         194 C "Western Digital Raptor 150GB" - "WDC
> WD1600JS-00NCB1"						194 C "Western Digital Caviar 1600JS 160GB 
Sata" -
> "WDC WD1600SD-01KCC0"						194 C "Western Digital Caviar RE Serial 
ATA
> series" - "WDC WD2500JD-57HBC0"                                          
> 194 C "Western Digital Caviar SE (Serial ATA) 250 GB" -@@ -518,6 +524,8 @@
> - "WDC WD2500JS-41MVB1"						194 C "Western Digital SATAII 
Caviar 250GB
> Special Edition 8MB" - "WDC WD2500JD-00HBB0"						194 C   
"Western Digital
> SATA 250GB"
> - "WDC WD2500KS-00MJB0"						194 C "Western Digital SATA-II 
Caviar 250GB
> Special Edition 16MB" -+"WDC WD2500YD-01NVB1"						194 C "Western 
Digital
> Caviar RE 250GB 16MB" - "WDC WD3000JS-00PDB0"						194 C "Western 
Digital
> WD3000JS"
> --"WDC WD3200KS-00PFB0"						194 C	""
> -+"WDC WD3200KS-00PFB0"						194 C "Western Digital Caviar 320GB 
16MB"
> - "WDC WD3200JD-22KLB0"                                           194 C
> "Western Digital Caviar SE 320GB 8MB" -+"WDC WD3200SD-01KNB0"						
194 C
> "Western Digital Caviar RE 320GB SATA 8MB" diff --git
> a/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp.db
> b/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp.db index 4a061cf..7b0cbd9
> 100644
> --- a/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp.db
> +++ b/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp.db
> @@ -80,6 +80,8 @@
> 
>  "FUJITSU MHV2100AH"		194  C	"FUJITSU MHV2100AH"
>  "FUJITSU MHV2100AT"		194  C	"FUJITSU MHV2100AT"
> +"FUJITSU MHV2100BH"		194  C  "FUJITSU MHV2100BH"
> +"FUJITSU MHV2060AH"		194  C  "FUJITSU MHV2060AH"
>  "FUJITSU MHV2080[AB]H"		194  C	"FUJITSU MHV2080AH"
> 
>  "FUJITSU MPF3204AH"		194  C	"Fujitsu MPF3204AH"
> @@ -325,11 +327,14 @@
>  "ST3120026A"				194  C	"Seagate Barracuda V ST3120026A"
>  "ST3160021A"				194  C	"Seagate Barracuda 7200.7 - ST3160021A"
>  "ST3160023(A|AS)"			194  C	"Seagate Barracuda V ST3160023A and AS 
(160Gb,
> ATA100 or Serial ATA)" +"ST316081[12](A|AS)"			194  C  "Seagate 
Barracuda
> 7200.9 160GB"
>  "ST3160827AS"				194  C	"Seagate Barracuda 7200.7 160GB (Serial 
ATA)"
>  "ST3200021A"				194  C	"Seagate Barracuda 7200.7 Plus 200GB"
>  "ST3200822(A|AS)"			194  C	"Seagate Barracuda 7200.7 Plus 200GB (PATA 
or
> SATA)" -"ST3200826A"				194  C	"Seagate Barracuda 7200.8 200Gb"
> +"ST3200826A"				194  C	"Seagate Barracuda 7200.8 200GB"
>  "ST3250623A"				194  C	"Seagate Barracuda 7200.16 250GB"
> +"ST3250624AS"				194  C  "Seagate Barracuda 7200.9 250GB SATA"
> +"ST3250624NS"				194  C  "Seagate NL35 SATA (RAID-Edition) 7200 
250GB"
>  "ST3250823A"				194  C	"Seagate Barracuda 7200.8 250GB"
>  "ST3250823A"				194  C	"Seagate Barracuda 7200.7 Plus 250GB"
>  "ST3250823NS"				194  C	"Seagate NL35 SATA (RAID-Edition) 7200 
250GB"
> @@ -338,9 +343,7 @@
>  "ST3400633(A|AS)"                       194  C  "Seagate Barracuda 7200.7
> 400 GB" "ST3500630NS"				194  C  "Seagate"
>  "ST3400632NS"				194  C	"Seagate"
> -"ST3320620AS"                           194  C  "Seagate Barracuda 7200.7
> 320 GB" -"ST3500630AS"                           194  C  "Seagate Barracuda
> 7200.7 500 GB" -"ST3802110A"				194  C	"Seagate Barracuda 7200.9 80 
GB"
> +"ST380[28]110(A|AS)"				194  C	"Seagate Barracuda 7200.9 80 GB"
>  "ST910021A"				194  C	"Seagate Momentus 7200.1 100GB"
>  "ST910082[35]A"				194  C	"Seagate Momentus 5400.2 100GB"
>  "ST9120821A"				194  C	"Seagate Momentus 5400.2 120GB"
> @@ -351,12 +354,14 @@
>  "ST960822A"				194  C	"Seagate Momentus 5400.2 60GB"
>  "ST96812AS"				194  C	"Seagate Momentus 5400.2 60GB SATA"
>  "ST9808211A"				194  C	"Seagate Momentus 5400.2 80GB"
> +"ST98823AS"				194  C  "Seagate Momentus 5400.2 80GB SATA"
> 
>  ########################################
>  ############# TOSHIBA Laptops
>  ########################################
>  "MK4313MAT"				220  C	"Toshiba MK4313MAT"
>  "TOSHIBA MK1032GAX"			194  C	"Toshiba MK1032GAX"
> +"TOSHIBA MK1032GSX"			194  C  "Toshiba MK1032GSX"
>  "TOSHIBA MK1517GAP"			0    C	"Toshiba MK1517GAP"
>  "TOSHIBA MK2018GAS"			226  F	"Toshiba MK2018GAS"
>  "TOSHIBA MK2023GAS"			194  C	"Toshiba MK2023GAS"
> @@ -377,6 +382,7 @@
>  "TOSHIBA MK6026GAX"			194  C	"Toshiba MK6026GAX"
>  "TOSHIBA MK8025GAS"			194  C	"Toshiba MK8025GAS"
>  "TOSHIBA MK8026GAX"			194  C	"Toshiba MK8026GAX"
> +"TOSHIBA MK8032GSX"			194  C  "Toshiba MK8032GSX"
> 
>  "MK4025GAS"				194  C	"Toshiba MK4025GAS"
> 
> @@ -397,7 +403,7 @@
>  "WDC WD300BB-00CAA0"						  0 C "Western Digital WD300BB"
>  "WDC WD360GD-00FNA0"						194 C "Western Digital SATA Raptor 
36.7GB"
>  "WDC WD400BB-00CAA0"						  0 C "Western Digital 400BB-00CAA0"
> -"WDC WD400BB-00J[KH]A0"						194 C "Western Digital Caviar 
WD400BB"
> +"WDC WD400BB-00[DJ][KH]A0"					194 C "Western Digital Caviar 
WD400BB"
>  "WDC WD400BB-23JHC0"						194 C "Western Digital 23JHC0"
>  #"WDC WD400BB-00GFA0"						  0 C ""
>  "WDC WD400BB-55HEA0"						194 C "Western Digital Caviar WD400BB"
> @@ -416,7 +422,7 @@
>  "WDC WD600VE-75HDT0"						194 C "Western Digital 600VE-75HDT0"
>  "WDC WD600VE-00HDT0"						194 C "Western Digital 600VE-00HDT0"
>  "WDC WD740GD-00FL21.0"						194 C "Western Digital SATA Raptor"
> -"WDC WD740GD-([05]0FL[AC]0|75FLA1)"				194 C "Western Digital SATA 
Raptor
> 74GB 8MB" +"WDC WD740GD-([05]0FL[AC][01]|75FLA1)"				194 C "Western 
Digital
> SATA Raptor 74GB 8MB" "WDC WD800BB-00CAA1"						  0 C "Western 
Digital
> WD800BB-00CAA1"
>  "WDC WD800BB-(00|22)DKA0"					194 C "Western Digital WD800BB 80 Go"
>  "WDC WD800BB-32CCB0"						194 C "Western Digital 800BB-32CCB0"
> @@ -428,14 +434,13 @@
>  "WDC WD800JB-00CRA1"						  0 C "Western Digital Caviar WD800JB"
>  "WDC WD800JB-00(ET|FM|FS)A0"					194 C "Western Digital Caviar 
80GB Special
> Edition 8MB" "WDC WD800JB-00JJ[AC]0"						194 C "Western Digital 
WD800JB"
> -"WDC WD800JD-(00|55)(HK|JR)A0"					194 C "Western Digital SATA 
80GB, 8MB
> Cache" -"WDC WD800JD-00(HK|JN)A0"					194 C "Western Digital SATA 
80GB, 8MB
> Cache" +"WDC WD800JD-(00|55|75)(HK|JR|JN)[AC]0"				194 C "Western 
Digital
> SATA 80GB, 8MB Cache" "WDC WD800LB-(00|55)DNA0"					194 C "Western 
Digital
> Caviar WD800LB 80 Go ATA-100" "WDC WD800VE-07HDT0"						194 C 
"Western
> Digital 800VE-07HDT0"
>  "WDC WD1200BB-00(FTA|GUA)0"					194 C "Western Digital Caviar 
EIDE 2MB
> Cache" -"WDC WD1200JB-00(EV|FU|GV)A0"					194 C "Western Digital 
Caviar
> 120GB Special Edition 8MB" +"WDC WD1200JB-00(EV|FU|GV|RE)A0"				194 
C
> "Western Digital Caviar 120GB Special Edition 8MB" "WDC
> WD1200JB-22GVA0"						194 C "Western Digital Caviar 120GB"
> -"WDC WD1200JD-00(GBB|HBC)0"					194 C "Western Digital WD1200JD"
> +"WDC WD1200JD-00(FYB|GBB|HBC)0"					194 C "Western Digital 
WD1200JD"
>  "WDC WD1200LB-55EDA0"						194 C "Western Digital WD1220LB"
>  "WDC WD1200SB-01KB[AC]0"					194 C "Western Digital Caviar RE 
(Raid
> Edition) 120 GB" "WDC WD1600BB-00DWA0"						194 C "Western Digital 
Caviar
> WD1600BB" @@ -443,10 +448,11 @@
>  "WDC WD2000BB-00FTA0"						194 C "Western Digital WD2000BB"
>  "WDC WD2000JB-(00EV|32EV|34EV|00FU|00GV|55GV|98GV|00KF)A0"	194 C "Western
> Digital Caviar 200GB Special Edition 8MB" "WDC WD2000JB-00GVC0"					
	194 C
> "Western Digital WD2000JB"
> +"WDC WD2000JD-00FYB0"						194 C "Western Digital WD2000JD"
>  "WDC WD2000JS-00MHB1"						194 C "Western Digital SATA 200GB"
>  "WDC WD2500JB-(00RE|00EV|00FU|32FU|00GV|55GV)A0"		194 C "Western Digital
> Caviar 250GB Special Edition 8MB" "WDC WD2500JB-00GVC0"						194 C 
"Western
> Digital 250GB"
> -"WDC WD2500JD-(00G|32H)BB0"					194 C "Western Digital SATA Caviar 
250GB
> Special Edition 8MB" +"WDC WD2500JD-(00G|32H|75H)BB0"					194 C 
"Western
> Digital SATA Caviar 250GB Special Edition 8MB" "WDC
> WD2500JD-40HBC0"						194 C "Western Digital WD2500JD-40HBC0" 
"WDC
> WD2500PB-98FBA0"						194 C "Western Digital Caviar 250GB 
Special Edition
> 8MB" "WDC WD2500PD-00FZB1"						194 C "Western Digital 
WD2500PD-00FZB1" @@
> -510,7 +516,7 @@
>  "Maxtor 7(L|V)300(F|R|S)0"		194 C "Maxtor MaXLine III 300GB 7200rpm"
>  "MAXTOR STM3320620AS"			194 C ""
> 
> -"WDC WD1500ADFD-00NLR1"                                         194 C
> "Western Digital Raptor 150GB" +"WDC WD1500ADFD-00NLR[01]"                 
>                        194 C "Western Digital Raptor 150GB" "WDC
> WD1600JS-00NCB1"						194 C "Western Digital Caviar 1600JS 160GB 
Sata" "WDC
> WD1600SD-01KCC0"						194 C "Western Digital Caviar RE Serial ATA 
series"
> "WDC WD2500JD-57HBC0"                                           194 C
> "Western Digital Caviar SE (Serial ATA) 250 GB" @@ -518,6 +524,8 @@
>  "WDC WD2500JS-41MVB1"						194 C "Western Digital SATAII Caviar 
250GB
> Special Edition 8MB" "WDC WD2500JD-00HBB0"						194 C   "Western 
Digital
> SATA 250GB"
>  "WDC WD2500KS-00MJB0"						194 C "Western Digital SATA-II Caviar 
250GB
> Special Edition 16MB" +"WDC WD2500YD-01NVB1"						194 C "Western 
Digital
> Caviar RE 250GB 16MB" "WDC WD3000JS-00PDB0"						194 C "Western 
Digital
> WD3000JS"
> -"WDC WD3200KS-00PFB0"						194 C	""
> +"WDC WD3200KS-00PFB0"						194 C "Western Digital Caviar 320GB 
16MB"
>  "WDC WD3200JD-22KLB0"                                           194 C
> "Western Digital Caviar SE 320GB 8MB" +"WDC WD3200SD-01KNB0"						
194 C
> "Western Digital Caviar RE 320GB SATA 8MB" diff --git
> a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
> b/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb index
> a0bc4e6..9483b5c 100644
> --- a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
> +++ b/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
> @@ -2,11 +2,12 @@ SUMMARY = "Hard disk temperature monitor daemon"
>  SECTION = "console/network"
>  LICENSE = "GPLv2+"
> 
> +PR = "r1"
> +
>  SRC_URI =
> "http://download.savannah.nongnu.org/releases/hddtemp/hddtemp-0.3-beta15.ta
> r.bz2 \ file://hddtemp-no-nls-support.patch \
>             file://hddtemp_0.3-beta15-52.diff \
>             file://hddtemp-0.3-beta15-autodetect-717479.patch \
> -           file://hddtemp-db.patch;striplevel=0 \
>             file://hddtemp.db \
>             file://init \
>             "

The only problem with doing this is that it might make it harder to update 
from Fedora's patchset later...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


